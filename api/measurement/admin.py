import nested_admin
from api.symbol.admin import SymbolInline

class MeasurementAdmin(nested_admin.NestedModelAdmin):
  list_display = (
    'title',
    'form',
    'family',
    'conversion',
    'convertible',
    'is_fraction',
  )
  search_fields = (
    'title',
  )
  list_filter = (
    'family',
    'form',
    'convertible',
    'is_fraction',
  )
  inlines = (
    SymbolInline,
  )
  raw_id_fields = (
      'family',
  )
