from django.contrib.auth import get_user_model
from rest_framework import mixins
from rest_framework.decorators import action
from rest_framework.viewsets import GenericViewSet
from rest_framework.exceptions import PermissionDenied

from .serializer import UserSerializer
User = get_user_model()

class UserViewSet(mixins.DestroyModelMixin,
                  mixins.RetrieveModelMixin,
                  GenericViewSet):
  serializer_class = UserSerializer

  def get_queryset(self):
    return User.objects.filter(id=self.request.user.id)

  @action(detail=False, methods=['get',])
  def current(self, request):
    self.kwargs["pk"] = request.user.id
    return super(UserViewSet, self).retrieve(request, pk=request.user.id)

  def delete(self, request):
    if request.user.is_super_user:
      return super(UserViewSet, self).delete(request)
    else:
      raise PermissionDenied()


