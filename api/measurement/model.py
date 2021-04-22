from django.db import models
from api.measurement_family.model import MeasurementFamily

class Measurement(models.Model):
  class Forms(models.IntegerChoices):
    volume = 0
    weight = 1 #volume * density
    temperature = 2

  title = models.CharField(max_length=50)
  conversion = models.FloatField()
  convertable = models.BooleanField()
  is_fraction = models.BooleanField()
  form = models.IntegerField(choices=Forms.choices)
  family = models.ForeignKey(MeasurementFamily, on_delete=models.SET_NULL, null=True)

  def __str__(self):
    return self.title

  class Meta:
    managed = True
    verbose_name = 'Measurement'
    verbose_name_plural = 'Measurements'
