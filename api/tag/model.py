from django.db import models

class Tag(models.Model):
  title = models.CharField(max_length=50)
  household = models.ForeignKey('Household', on_delete=models.CASCADE)
  on_type = models.CharField(max_length=50)

  def __str__(self):
    return f'Tag({self.id}) - {self.title}'

  class Meta:
    managed = True
    verbose_name = 'Tag'
    verbose_name_plural = 'Tags'
