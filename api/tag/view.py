from rest_framework import viewsets, mixins
from django_filters.rest_framework import DjangoFilterBackend

from api.utils.household_viewset_utils import PreventCrossHouseholdUpdates
from .serializer import  (
  TagSerializer,
  CreateTagSerializer,
)
from .model import Tag

from api import filters

__all__ = [
  'TagViewSet'
]

class TagViewSet(
  PreventCrossHouseholdUpdates,
  viewsets.GenericViewSet,
  mixins.ListModelMixin,
  mixins.CreateModelMixin,
  mixins.DestroyModelMixin,
):
  queryset = Tag.objects.all()
  filterset_fields = ['title',]
  filter_backends = [filters.CurrentHouseholdFilterBackend, DjangoFilterBackend,]

  def get_serializer_class(self):
    if self.action in ['create']:
      # Create in one bulk create.
      # It is not possible to create an item without a list.
      return CreateTagSerializer
    # Default is to serializer all the way down to give all the data.
    return TagSerializer
