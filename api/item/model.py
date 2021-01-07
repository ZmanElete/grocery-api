from django.db import models

class Item(models.Model):
  title = models.CharField(max_length=50)
  list = models.ForeignKey('List', on_delete=models.CASCADE)
  measurement = models.ForeignKey('Measurement', on_delete=models.CASCADE)
  quantity = models.FloatField()#might be easier as a string field. Not sure XD

  def __str__(self):
    #TODO make quantity show as a fraction
    return f'{self.quantity} - {self.title}'

  class Meta:
    managed = True
    verbose_name = 'Item'
    verbose_name_plural = 'Items'
