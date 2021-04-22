from rest_framework import serializers

from .model import Symbol

class SymbolSerializer(serializers.ModelSerializer):
  class Meta:
    model = Symbol
    fields = "__all__"
