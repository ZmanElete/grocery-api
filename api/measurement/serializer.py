from rest_framework import serializers
from .model import Measurement

class MeasurementSerializer(serializers.ModelSerializer):
  class Meta:
    model = Measurement
    fields = "__all__"
