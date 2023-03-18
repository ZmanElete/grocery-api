from rest_framework import serializers
from api.ingredient.serializer import IngredientDetailSerializer
from api.measurement.serializer import MeasurementSerializer
from api.tag.serializer import TagSerializer, TagsMixin
from api.utils.read_only_serializer import ReadOnlyModelSerializer
from .model import Item

__all__ = [
  'SimpleItemSerializer',
  'ItemDetailSerializer',
  'CreateItemSerializer',
]


class SimpleItemSerializer(serializers.ModelSerializer):
  class Meta:
    model = Item
    fields = "__all__"

class ItemDetailSerializer(ReadOnlyModelSerializer, serializers.ModelSerializer):
  measurement = MeasurementSerializer(many=False)
  tags = TagSerializer(many=True)
  ingredient = IngredientDetailSerializer()

  class Meta:
    model = Item
    fields = "__all__"


class CreateItemSerializer(TagsMixin, serializers.ModelSerializer):
  class Meta:
    model = Item
    exclude = ['list',]

