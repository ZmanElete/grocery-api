import nested_admin
from django.contrib import admin
from .model import Tag


class TagInline(nested_admin.NestedTabularInline):
  model = Tag
  extra = 0
  raw_id_fields = (
    'household',
  )

class TagAdmin(admin.ModelAdmin):
  model = Tag
  raw_id_fields = ('household',)
