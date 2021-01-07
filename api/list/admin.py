from .model import List
from api.item.admin import ItemInline
import nested_admin

class ListAdmin(nested_admin.NestedModelAdmin):
  list_display = (
    'title',
    'household',
    'active',
    'referenceable'
  )
  search_fields = (
    'title',
    'household',
    'active',
    'id',
    'referenceable',
  )
  raw_id_fields = (
    'household',
  )
  list_filter = (
    'active',
    'referenceable',
  )
  inlines = (
    ItemInline,
  )
