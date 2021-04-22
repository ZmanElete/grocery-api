from rest_framework import viewsets

from .model import Measurement
from .serializer import MeasurementSerializer

class MeasurementViewset(viewsets.ReadOnlyModelViewSet):
  queryset = Measurement.objects.all()
  serializer_class = MeasurementSerializer

