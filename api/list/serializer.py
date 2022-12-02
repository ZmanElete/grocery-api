from rest_framework.serializers import ModelSerializer
from api.item.model import Item
from api.item.serializer import CreateItemSerializer, ItemDetailSerializer
from .model import List

class ListSerializer(ModelSerializer):
  class Meta:
    model = List
    fields = "__all__"


class ListDetailSerializer(ModelSerializer):
  item_set = ItemDetailSerializer(many=True)

  class Meta:
    model = List
    fields = "__all__"


class CreateListSerializer(ModelSerializer):
  item_set = CreateItemSerializer(many=True)

  class Meta:
    model = List
    fields = "__all__"

  def create(self, validated_data):
    item_set = validated_data.pop('item_set')
    list = List.objects.create(**validated_data)
    [ Item.objects.create(list=list, **item) for item in item_set ]
    return list
