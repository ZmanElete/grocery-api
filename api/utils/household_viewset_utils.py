from rest_framework.fields import empty

from api.utils.act_on_keys import actOnKeys, createAddValueAct, deleteItem

class PreventCrossHouseholdUpdates():
  '''
  Overrides [get_queryset] and [get_serializer] to remove loopholes for updating a household for the object.

  get_queryset:
  Specifically filters out objects not relating the the current users household if the action is a writing action.

  get_serializer:
  Cleans the 'household' key from the data passed into the get serializer function if its a partial update
  and forces the household key to be the current users household when creating and updating
  '''

  household_key = 'household'
  household_in_object = {
    'household': True,
    'tags': [
      { 'household': True, }
    ]
  }

  def get_queryset(self):
    queryset = self.queryset
    if self.action != 'list' and self.action != 'retrieve':
      queryset = queryset.filter(**{self.household_key: self.request.user.household})
    return queryset

  def get_serializer(self, instance=None, data=empty, *args, **kwargs):
    if self.action == 'create' or self.action == 'update':
      # If household is on the object. Override household with the users household
      actOnKeys(data, self.household_in_object, createAddValueAct(self.request.user.household.id))
    elif self.action == 'partial_update' and "household" in data.keys():
      actOnKeys(data, self.household_in_object, deleteItem)
    return super().get_serializer(instance=instance, data=data, *args,  **kwargs)
