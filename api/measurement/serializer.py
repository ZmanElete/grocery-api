from rest_framework import serializers

from api.measurement_family.serializer import MeasurementFamilySerializer
from api.symbol.serializer import SymbolSerializer
from api.utils.read_only_serializer import ReadOnlyModelSerializer

from .model import Measurement

class MeasurementSerializer(ReadOnlyModelSerializer, serializers.ModelSerializer):
  family = MeasurementFamilySerializer()
  symbol_set = SymbolSerializer(many=True)
  class Meta:
    model = Measurement
    fields = "__all__"
