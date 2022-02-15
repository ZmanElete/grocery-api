
from django.contrib.auth import get_user_model
from rest_framework.serializers import ModelSerializer

from api.household.serializer import HouseholdSerializer

User = get_user_model()
class UserSerializer(ModelSerializer):
  household = HouseholdSerializer()

  class Meta:
    model = User
    fields = (
      'id',
      'is_superuser',
      'first_name',
      'last_name',
      'is_staff',
      'is_active',
      'date_joined',
      'email',
      'household',
    )
