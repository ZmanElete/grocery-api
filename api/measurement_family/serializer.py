from rest_framework import serializers
from .model import MeasurementFamily

class MeasurementFamilySerializer(serializers.ModelSerializer):
  class Meta:
    model = MeasurementFamily
    fields = "__all__"
