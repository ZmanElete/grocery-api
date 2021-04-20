from rest_framework.viewsets import ModelViewSet
from rest_framework.decorators import action
from .serializer import ListSerializer
from .model import List
from rest_framework.response import Response

class ListViewSet(ModelViewSet):
  serializer_class = ListSerializer

  def get_queryset(self):
    return List.objects.filter(household=self.request.user.household)

  @action(detail=False, methods=['post'])
  def filtered_list(self, request):
    user = request.user

    filters = {
      "household": user.household,
    }
    if request.data.get('active', None) != None:
      filters['active'] = request.data.get('active')
    if request.data.get('referenceable', None) != None:
      filters['referenceable'] = request.data.get('referenceable')
    lists = List.objects.filter(**filters)
    serializer = serializer_class(lists, many=True)
    return Response(serializer.data)

