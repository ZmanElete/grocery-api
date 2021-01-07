from django.contrib import admin

class HouseholdAdmin(admin.ModelAdmin):
  list_display = ('id', 'title')
  readonly_fields = ('id',)
