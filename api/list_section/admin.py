from .model import ListSection
import nested_admin

class ListSectionInline(nested_admin.NestedTabularInline):
  model = ListSection
  extra = 0
  raw_id_fields = (
    'list',
  )
