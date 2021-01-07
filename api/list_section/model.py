
from django.db import models

class ListSection(models.Model):
  title = models.CharField
  recipe = models.ForeignKey('Recipe', on_delete=models.CASCADE)
  sort_order = models.IntegerField(default=1)
  list = models.ForeignKey('List', on_delete=models.CASCADE)

  def __str__(self):
    return f'{self.id} - {self.recipe.title} - {self.title}'

  class Meta:
    managed = True
    verbose_name = 'ListSection'
    verbose_name_plural = 'ListSections'
