from rest_framework import serializers

from .model import Measurement
from api.measurement_family.serializer import MeasurementFamilySerializer
from api.symbol.serializer import SymbolSerializer

class MeasurementSerializer(serializers.ModelSerializer):
  family = MeasurementFamilySerializer();
  symbol_set = SymbolSerializer(many=True);
  class Meta:
    model = Measurement
    fields = "__all__"
