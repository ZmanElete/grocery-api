from rest_framework.serializers import ModelSerializer
from api.item.serializer import ItemSerializer
from .model import List

class ListSerializer(ModelSerializer):
  item_set = ItemSerializer(many=True)

  class Meta:
    model = List
    fields = "__all__"
