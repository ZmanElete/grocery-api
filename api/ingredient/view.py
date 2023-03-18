from rest_framework import viewsets, mixins, filters
from django_filters.rest_framework import DjangoFilterBackend

from api.utils.household_viewset_utils import PreventCrossHouseholdUpdates
from .serializer import  (
  UpdateCreateIngredientSerializer,
  IngredientDetailSerializer,
)
from .model import Ingredient

from api.filters import CurrentHouseholdFilterBackend

__all__ = [
  'IngredientViewSet'
]

class IngredientViewSet(
  PreventCrossHouseholdUpdates,
  viewsets.GenericViewSet,
  mixins.ListModelMixin,
  mixins.CreateModelMixin,
  mixins.DestroyModelMixin,
  mixins.RetrieveModelMixin,
  mixins.UpdateModelMixin
):
  queryset = Ingredient.objects.all()
  filter_backends = [CurrentHouseholdFilterBackend, filters.SearchFilter,]
  search_fields = ["title", ]

  def get_serializer_class(self):
    if self.action in ['create', 'update', 'partial_update', 'delete']:
      return UpdateCreateIngredientSerializer
    # Default is to serializer all the way down to give all the data.
    return IngredientDetailSerializer
