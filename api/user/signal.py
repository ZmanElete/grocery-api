from django.dispatch import receiver
from django.db.models.signals import pre_save

from api.household.model import Household
from .model import GUser

@receiver(pre_save, sender=GUser)
def before(sender, instance, **kwargs):
  if not instance.household:
    household = Household(title=f"The {instance.last_name}\'s Household")
    household.save()
    instance.household = household
    instance.save()
