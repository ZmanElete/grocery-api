from rest_framework import serializers
from .model import Ingredient

class IngredientSerializer(serializers.ModelField):
  class Meta:
    model=Ingredient
