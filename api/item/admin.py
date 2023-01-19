from .model import Item
from api.tag.admin import TagInline
import nested_admin

class TagItemRelationInline(nested_admin.NestedTabularInline):
    model = Item.tags.through
    inlines = (TagInline,)

class ItemInline(nested_admin.NestedTabularInline):
  model = Item
  extra = 0
  raw_id_fields = (
    'measurement',
    'ingredient',
  )
  inlines = (
    TagItemRelationInline,
  )
