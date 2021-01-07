import uuid
from django.db import models

class Household(models.Model):
  title = models.CharField(max_length=50)
  id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)

  def __str__(self):
    return f'{self.title} - {self.id}'

  class Meta:
    managed = True
    verbose_name = 'Household'
    verbose_name_plural = 'Households'
