from django.contrib import admin

from api.user.admin import GUserAdmin
from api.household.admin import HouseholdAdmin
from api.list.admin import ListAdmin
from api.recipe.admin import RecipeAdmin
from api.measurement.admin import MeasurementAdmin
import api.models as api_models

admin.site.register(api_models.GUser, GUserAdmin)
admin.site.register(api_models.Household, HouseholdAdmin)
admin.site.register(api_models.List, ListAdmin)
admin.site.register(api_models.Recipe, RecipeAdmin)
admin.site.register(api_models.Measurement, MeasurementAdmin)
