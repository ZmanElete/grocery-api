from django.db import models

class Ingredient(models.Model):
  title = models.CharField(max_length=50)
  household = models.ForeignKey('Household', on_delete=models.CASCADE)

  purchasing_quantity = models.FloatField()
  purchasing_measurement = models.ForeignKey('Measurement', on_delete=models.CASCADE)

  tags = models.ManyToManyField('Tag')
  #Special Instructions?

  def __str__(self):
    #TODO make quantity show as a fraction
    return f'Ingredient({id}) - {self.title}'

  class Meta:
    managed = True
    verbose_name = 'Ingredient'
    verbose_name_plural = 'Ingredients'
