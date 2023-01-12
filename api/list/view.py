from rest_framework import viewsets, mixins
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.decorators import action

from api.utils.household_viewset_utils import PreventCrossHouseholdUpdates
from .serializer import CreateListSerializer, ListDetailSerializer, ListSerializer
from .model import List
from rest_framework.response import Response

from api import filters

class ListViewSet(
  PreventCrossHouseholdUpdates,
  viewsets.GenericViewSet,
  mixins.ListModelMixin,
  mixins.UpdateModelMixin,
  mixins.CreateModelMixin,
  mixins.RetrieveModelMixin,
  mixins.DestroyModelMixin,
):
  queryset = List.objects.filter(recipe__isnull=True)
  filterset_fields = ['active', 'referenceable']
  filter_backends = [filters.CurrentHouseholdFilterBackend, DjangoFilterBackend,]

  def get_serializer_class(self):
    if self.action in ['create']:
      # Create in one bulk create.
      # It is not possible to create an item without a list.
      return CreateListSerializer
    elif self.action in ['update', 'partial_update', 'delete']:
      # User a more simple serializer for update/partial_update/delete,
      # don't allow updating children from the parent
      return ListSerializer
    # Default is to serializer all the way down to give all the data.
    return ListDetailSerializer
