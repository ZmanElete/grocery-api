from django.db import models

class Measurement(models.Model):
  title = models.CharField(max_length=50)
  conversion = models.FloatField()
  convertable = models.BooleanField()
  is_fraction = models.BooleanField()

  def __str__(self):
    return self.title

  class Meta:
    managed = True
    verbose_name = 'Measurement'
    verbose_name_plural = 'Measurements'
