from rest_framework.serializers import ModelSerializer

from api.utils.read_only_serializer import ReadOnlyModelSerializer

from .model import Tag

__all__ = (
  'TagSerializer',
  'CreateTagSerializer',
  'TagsMixin',
)

class TagSerializer(ReadOnlyModelSerializer, ModelSerializer):
  class Meta:
    model = Tag
    fields = '__all__'


class CreateTagSerializer(ModelSerializer):
  class Meta:
    model = Tag
    fields = "__all__"


class TagsMixin():
  tags = CreateTagSerializer(many=True)

  def get_fields(self):
    fields = super().get_fields()
    fields['tags'] = CreateTagSerializer(many=True)
    return fields

  def create(self, validated_data):
    tags_data = validated_data.pop('tags', [])
    instance = super().create(validated_data)
    type_name = self.Meta.model.__name__
    tags = [ Tag.objects.get_or_create(**tag, on_type=type_name)[0] for tag in tags_data ]
    instance.tags.set(tags)
    return instance

  def update(self, instance, validated_data):
    validated_data.pop('id', None)
    tags_data = validated_data.pop('tags', [])
    type_name = self.Meta.model.__name__
    instance = super().update(instance, validated_data)

    tags = []
    for tag_data in tags_data:
      tag_data.pop('id', None)
      tags.append(Tag.objects.get_or_create(**tag_data, on_type=type_name)[0])

    instance.tags.set(tags)
    return instance



