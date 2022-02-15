
from rest_framework.serializers import ModelSerializer

from api.household.model import Household

class HouseholdSerializer(ModelSerializer):
    class Meta:
        model=Household
        fields='__all__'
