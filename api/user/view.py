from django.contrib.auth import get_user_model
from rest_framework.decorators import action
from rest_framework.viewsets import ModelViewSet
from rest_framework.exceptions import PermissionDenied

from .serializer import UserSerializer
User = get_user_model()

class UserViewSet(ModelViewSet):
  serializer_class = UserSerializer

  def get_queryset(self):
    return User.objects.filter(id=self.request.user.id)

  @action(detail=False, methods=['post'])
  def current(self, request):
    return super(UserViewSet, self).retrieve(request, pk=request.user.id)

  def delete(self, request):
    if request.user.is_super_user:
      return super(UserViewSet, self).delete(request)
    else:
      raise PermissionDenied()


