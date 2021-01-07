from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from api.user.form import GUserCreationForm, GUserChangeForm
from .model import GUser


class GUserAdmin(UserAdmin):
    add_form = GUserCreationForm
    form = GUserChangeForm
    model = GUser
    list_display = ('email', 'household', 'last_name', 'is_staff', 'is_active',)
    list_filter = ('is_staff', 'is_active')
    fieldsets = (
        (None, {'fields': ('first_name', 'last_name', 'email', 'password', 'household')}),
        ('Permissions', {'fields': ('is_staff', 'is_active')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('first_name', 'last_name', 'email', 'password1', 'password2', 'is_staff', 'is_active', 'household', )}
        ),
    )
    raw_id_fields=('household',)
    search_fields = ('email', 'household', 'first_name', 'last_name')
    ordering = ('household', 'email', 'last_name', 'first_name')
