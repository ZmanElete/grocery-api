from rest_framework import serializers
from api.measurement.serializer import MeasurementSerializer
from .model import Item

class SimpleItemSerializer(serializers.ModelSerializer):
  class Meta:
    model = Item
    fields = "__all__"

class ItemDetailSerializer(serializers.ModelSerializer):
  measurement = MeasurementSerializer(many=False)
  class Meta:
    model = Item
    fields = "__all__"


class CreateItemSerializer(serializers.ModelSerializer):
  class Meta:
    model = Item
    # We exclude list so that we don't get errors when it does not exist on a new item.
    exclude = ('list',)



