from rest_framework import serializers
from api.measurement.serializer import MeasurementSerializer
from api.tag.serializer import (
  TagSerializer,
  CreateTagSerializer,
  TagsMixin,
)
from api.tag.model import Tag
from api.utils.read_only_serializer import ReadOnlyModelSerializer

from .model import Ingredient

__all__ = [
  'IngredientDetailSerializer'
  'CreateIngredientSerializer'
]

class IngredientDetailSerializer(TagsMixin, ReadOnlyModelSerializer, serializers.ModelSerializer):
  tags = TagSerializer(many=True)
  purchasing_measurement = MeasurementSerializer(many=False)

  class Meta:
    model = Ingredient
    fields = "__all__"


class UpdateCreateIngredientSerializer(TagsMixin, serializers.ModelSerializer):
  class Meta:
    model = Ingredient
    fields = "__all__"
