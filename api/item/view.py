from rest_framework import viewsets, mixins

from api.item.model import Item
from api.item.serializer import CreateItemSerializer, ItemDetailSerializer
from api.utils.household_viewset_utils import PreventCrossHouseholdUpdates

class ItemViewSet(
  viewsets.GenericViewSet,
  mixins.UpdateModelMixin,
  mixins.RetrieveModelMixin,
  mixins.DestroyModelMixin,
  mixins.CreateModelMixin,
  PreventCrossHouseholdUpdates
):
  queryset = Item.objects.all()
  serializer_class = ItemDetailSerializer
  household_key='list__household'

  def get_serializer_class(self):
    if self.action in ['create', 'update', 'partial_update', 'delete']:
      # Create in one bulk create.
      # It is not possible to create an item without a list.
      return CreateItemSerializer
    # Default is to serializer all the way down to give all the data.
    return ItemDetailSerializer

