from rest_framework import viewsets
from rest_framework.decorators import action
from .serializer import ListSerializer
from .model import List
from rest_framework.response import Response

class ListViewSet(viewsets.ViewSet):

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
    serializer = ListSerializer(lists, many=True)
    return Response(serializer.data)

