from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext as _

from api.user.manager import GUserManager

class GUser(AbstractUser):
  username = None
  #TODO on_delete make new household for users.
  household = models.ForeignKey('Household', on_delete=models.PROTECT, null=True, blank=True)
  email = models.EmailField(_('email address'), unique=True)

  USERNAME_FIELD = 'email'
  REQUIRED_FIELDS = []

  objects = GUserManager()

  # def __str__(self):
  #   return self.email
