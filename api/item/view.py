from rest_framework import viewsets, mixins

from api.item.model import Item
from api.item.serializer import ItemDetailSerializer
from api.utils.household_viewset_utils import PreventCrossHouseholdUpdates

class ItemViewSet(
  viewsets.GenericViewSet,
  mixins.UpdateModelMixin,
  mixins.RetrieveModelMixin,
  PreventCrossHouseholdUpdates
):
  queryset = Item.objects.all()
  serializer_class = ItemDetailSerializer
  household_key='list__household'
