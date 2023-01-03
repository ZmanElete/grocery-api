
from django.db import models


# NOT SURE WHY THIS EXISTS
# I AM GUESSING (YEARS LATER) THAT THIS COULD
# POSSIBLY BE SO YOU CAN MARK OFF THE THINGS YOU HAVE MADE
# AND IT CAN HELP TRACK WHATS IN YOUR PANTRY.
# FOR NOW, WE ARE NOT GOING TO WORRY ABOUT IT.

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
