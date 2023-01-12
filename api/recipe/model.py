from django.db import models

class Recipe(models.Model):
  title = models.CharField(max_length=50)
  household = models.ForeignKey('Household', on_delete=models.CASCADE)
  instructions = models.TextField(blank=True)
  standard_serving = models.IntegerField()
  list = models.ForeignKey('List', on_delete=models.CASCADE)

  def __str__(self):
    return f'{self.id} - {self.title}'

  class Meta:
    managed = True
    verbose_name = 'Recipe'
    verbose_name_plural = 'Recipes'

  def delete(self, using=None):
    super().delete(using)
    self.list.delete()
