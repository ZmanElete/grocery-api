from django.db import models

class Symbol(models.Model):
  title = models.CharField(max_length=10)
  measurement = models.ForeignKey('Measurement', on_delete=models.CASCADE)
