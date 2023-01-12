from rest_framework.serializers import ModelSerializer
from api.list.model import List
from api.list.serializer import CreateListSerializer, ListDetailSerializer
from api.recipe.model import Recipe

class UpdateRecipeSerializer(ModelSerializer):
  class Meta:
    model = Recipe
    exclude = ("list",)

class RecipeDetailSerializer(ModelSerializer):
  list = ListDetailSerializer(many=False)

  class Meta:
    model = Recipe
    fields = "__all__"


class CreateRecipeSerializer(ModelSerializer):
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
