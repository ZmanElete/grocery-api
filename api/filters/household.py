from django.db.models import Q
from rest_framework import filters

__all__ = [
  'CurrentHouseholdFilterBackend',
]

class CurrentHouseholdFilterBackend(filters.BaseFilterBackend):
  '''
  Add current_household=false to remove the household filtering.
  '''

  def filter_queryset(self, request, queryset, view):
    user = request.user
    current_household = request.query_params.get('current_household', None)
    if current_household != None:
      q = Q(household=user.household)
      if current_household == 'false':
        q = ~q
      queryset = queryset.filter(q)
    return queryset
