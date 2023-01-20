from rest_framework import viewsets, mixins
from django_filters.rest_framework import DjangoFilterBackend

from api.utils.household_viewset_utils import PreventCrossHouseholdUpdates
from .serializer import  (
  UpdateCreateIngredientSerializer,
  IngredientDetailSerializer,
)
from .model import Ingredient

from api import filters

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
  # filterset_fields = ['active', 'referenceable']
  filter_backends = [filters.CurrentHouseholdFilterBackend, DjangoFilterBackend,]

  def get_serializer_class(self):
    if self.action in ['create', 'update', 'partial_update', 'delete']:
      return UpdateCreateIngredientSerializer
    # Default is to serializer all the way down to give all the data.
    return IngredientDetailSerializer
