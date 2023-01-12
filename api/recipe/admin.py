import nested_admin

# from api.list_section.admin import ListSectionInline
from .model import Recipe

class RecipeAdmin(nested_admin.NestedModelAdmin):
  list_display = (
    'title',
    'household',
  )
  search_fields = (
    'id',
    'title',
    'instructions',
    'standard_serving',
  )
  raw_id_fields = (
    'household',
    'list',
  )
