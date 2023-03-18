from rest_framework import viewsets, mixins
from django_filters.rest_framework import (
  DjangoFilterBackend,
)

from rest_framework.filters import SearchFilter

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
  mixins.DestroyModelMixin,
):
  queryset = Tag.objects.all()
  filterset_fields = ['on_type', 'title', ]
  filter_backends = [filters.CurrentHouseholdFilterBackend, DjangoFilterBackend, SearchFilter]
  search_fields = [ 'title', ]

  def get_serializer_class(self):
    return TagSerializer
