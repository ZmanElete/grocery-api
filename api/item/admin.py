from .model import Item
import nested_admin

class ItemInline(nested_admin.NestedTabularInline):
  model = Item
  extra = 0
  raw_id_fields = (
    'measurement',
  )
