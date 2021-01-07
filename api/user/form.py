from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .model import GUser


class GUserCreationForm(UserCreationForm):

    class Meta(UserCreationForm):
        model = GUser
        fields = ('email',)


class GUserChangeForm(UserChangeForm):

    class Meta:
        model = GUser
        fields = ('email',)
