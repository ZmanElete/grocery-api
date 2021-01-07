import nested_admin
from api.symbol.admin import SymbolInline

class MeasurementAdmin(nested_admin.NestedModelAdmin):
  list_display = (
    'title',
    'conversion',
    'convertable',
    'is_fraction',
  )
  search_fields = (
    'title',
    'conversion',
    'convertable',
    'is_fraction',
  )
  list_filer = (
    'convertable',
    'is_fraction',
  )
  inlines = (
    SymbolInline,
  )
