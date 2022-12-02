from django.urls import path, include
from rest_framework import routers
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView
)

from . import views

router = routers.DefaultRouter()
router.register('list', views.ListViewSet, basename='list')
router.register('user', views.UserViewSet, basename='user')
router.register('measurement', views.MeasurementViewset, basename='measurement')
router.register('item', views.ItemViewSet, basename='item')

urlpatterns = [
  # Rest SimpleJWT endpoints
  path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
  path('login/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
  path('login/verify/', TokenVerifyView.as_view(), name='token_verify'),

  # Router/viewset endpoints
  path('', include(router.urls)),
]
