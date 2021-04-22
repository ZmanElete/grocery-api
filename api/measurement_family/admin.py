import nested_admin
from api.symbol.admin import SymbolInline

class MeasurementFamilyAdmin(nested_admin.NestedModelAdmin):
  list_display = (
    'title',
  )
  search_fields = (
    'title',
  )
