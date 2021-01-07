from django.db import models

class Recipe(models.Model):
  title = models.CharField(max_length=50)
  household = models.ForeignKey('Household', on_delete=models.CASCADE)
  instructions = models.TextField()
  standard_serving = models.IntegerField()

  def __str__(self):
    return f'{self.id} - {self.title}'

  class Meta:
    managed = True
    verbose_name = 'Recipe'
    verbose_name_plural = 'Recipes'
