from rest_framework import serializers
from api.measurement.serializer import MeasurementSerializer
from .model import Item

class ItemSerializer(serializers.ModelSerializer):
  measurement = MeasurementSerializer(many=False)
  class Meta:
    model = Item
    fields = "__all__"
