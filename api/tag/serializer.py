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
    fields = '__all__'


class TagsMixin():
  tags = CreateTagSerializer(many=True)

  @property
  def model_type(self):
    return self.Meta.model.__name__

  def get_fields(self):
    fields = super().get_fields()
    fields['tags'] = CreateTagSerializer(many=True)
    return fields

  def to_internal_value(self, data):
    for tag in data.get('tags', []):
      tag['on_type'] = self.model_type
    return super().to_internal_value(data)

  def create(self, validated_data):
    tags_data = validated_data.pop('tags', [])
    instance = super().create(validated_data)
    tags = [ Tag.objects.get_or_create(**tag)[0] for tag in tags_data ]
    instance.tags.set(tags)
    return instance

  def update(self, instance, validated_data):
    validated_data.pop('id', None)
    tags_data = validated_data.pop('tags', [])
    instance = super().update(instance, validated_data)

    tags = []
    for tag_data in tags_data:
      tag_data.pop('id', None)
      tags.append(Tag.objects.get_or_create(**tag_data)[0])

    instance.tags.set(tags)
    return instance



