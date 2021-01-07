import nested_admin
from .model import Symbol

class SymbolInline(nested_admin.NestedTabularInline):
  model = Symbol
  extra = 0
