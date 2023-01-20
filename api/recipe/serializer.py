from rest_framework.serializers import ModelSerializer
from api.list.serializer import CreateListSerializer, ListDetailSerializer
from api.recipe.model import Recipe
from api.tag.serializer import TagsMixin
from api.utils.read_only_serializer import ReadOnlyModelSerializer

class UpdateRecipeSerializer(TagsMixin, ModelSerializer):
  class Meta:
    model = Recipe
    exclude = ("list",)

class RecipeDetailSerializer(TagsMixin, ReadOnlyModelSerializer, ModelSerializer):
  list = ListDetailSerializer(many=False)

  class Meta:
    model = Recipe
    fields = "__all__"


class CreateRecipeSerializer(TagsMixin, ModelSerializer):
  list = CreateListSerializer()

  class Meta:
    model = Recipe
    fields = "__all__"

  def create(self, validated_data):
    list_data = validated_data.pop('list')
    serializer = CreateListSerializer(data=list_data)
    list = serializer.create(list_data)
    validated_data['list'] = list
    return super().create(validated_data)
