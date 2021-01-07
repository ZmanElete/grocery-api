from rest_framework import serializers
from api.item.serializer import ItemSerializer
from .model import List

class ListSerializer(serializers.ModelSerializer):
  item_set = ItemSerializer(many=True)

  class Meta:
    model = List
    fields = "__all__"
