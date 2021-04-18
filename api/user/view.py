from django.contrib.auth.models import User
from rest_framework.viewsets import ModelViewSet

from .serializer import UserSerializer

class UserViewSet(ModelViewSet):
  serializer_class = UserSerializer

  def get_queryset(self):
    return User.objects.filter(household=self.request.user.household)

