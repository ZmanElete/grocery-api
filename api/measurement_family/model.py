from django.db import models

class MeasurementFamily(models.Model):
  title = models.CharField(max_length=60)

  def __str__(self):
    return self.title
