
from django.db import models

class List(models.Model):
  title = models.CharField(max_length=50)
  household = models.ForeignKey('Household', on_delete=models.CASCADE)
  active = models.BooleanField(default=True)
  referenceable = models.BooleanField(default=True)
  tags = models.ManyToManyField('Tag')

  def __str__(self):
    return f'{self.id} - {self.title}'

  class Meta:
    managed = True
    verbose_name = 'List'
    verbose_name_plural = 'Lists'
