from .model import Ingredient
from api.tag.admin import TagInline
import nested_admin

# class TagIngredientRelationInline(nested_admin.NestedTabularInline):
#     model = Ingredient.tags.through
#     inlines = (TagInline,)

class IngredientAdmin(nested_admin.NestedModelAdmin):
  list_display = (
    'title',
    'household',
  )
  search_fields = (
    'title',
    'household',
    'id',
    'tags__title'
  )
  raw_id_fields = (
    'household',
  )
  # inlines = (
  #   TagIngredientRelationInline,
  # )
