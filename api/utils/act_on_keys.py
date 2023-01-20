from typing import Any, Callable, Dict, Iterable, Union

# This act function will delete the keys that have True as their value in the to_act object if the
def deleteItem(tree: dict, key: str):
    if key in tree.keys():
        del tree[key]

# This function will create a addValue act function for act on keys, adding the value passed in.
def createAddValueAct(value) -> Callable[[dict, str], None]:
  def addValue(tree: dict, key: str):
    tree[key] = value
  return addValue

# This is a function that allows you to define an object that defines a set of keys to act on
# to_act = {
#     "a": {
#         "deleteme": True,
#         "b": {
#             "deleteme": True,
#         },
#     },
#     "deleteme": True,
#     "d": {
#         "es": [
#             { "deleteme": True, 'f2': True},
#             { "f3": True, },
#         ],
#     },
# }

# With this example object all of the keys that are labeled "deleteme"
# due to having the same structure as above, will be acted on
# tree = {
#     "a": {
#         "b": {
#             "deleteme": 1,
#             "something-else": {
#                 "id": 1,
#             },
#         },
#         "deleteme": 1,
#         "data": [
#             12,
#             34,
#         ],
#     },
#     "deleteme": 1,
#     "c": {
#         "d": {
#             "data": [1,2,3],
#         },
#     },
#     "d": {
#         "es": [
#             { "deleteme": 1, "f1": 1},
#             { "deleteme": 1, "f2": 1},
#             { "deleteme": 1, "f3": 1},
#             { "f4": 4},
#             1,
#         ],
#         "id": 52
#     }
# }
#
# In this example we will use the deleteItem act function
# actOnKeys(tree, to_delete, deleteItem)
# resulting object:
# {
#     'a': {
#         'b': {
#             'something-else': {
#                 'id': 1
#             }
#         },
#         'data': [ 12, 34]
#     },
#     'c': {
#         'd': {
#             'data': [1, 2, 3]
#         }
#     },
#     'd': {
#         'es': [
#             {'f1': 1},
#             {},
#             {},
#             {'f4': 4},
#             1
#         ],
#         'id': 52
#     }
# }
def actOnKeys(
    tree: Dict[str, Any],
    to_act: Dict[str, Union[dict, bool, list]],
    act: Callable[[dict, str], None]):
    for key, value in to_act.items():
        tree_value = tree.get(key)

        if type(value) is dict:

            if type(tree_value) is not dict:
                #skip keys that don't exist in tree
                continue

            actOnKeys(tree_value, value, act)

        elif isinstance(value, Iterable) and isinstance(tree_value, Iterable):
            for li in value:
                if type(li) is dict:
                    for li_tree_value in tree_value:
                        if type(li_tree_value) is dict:
                            actOnKeys(li_tree_value, li, act)

                else:
                    raise Exception("Only valid values in to_act are dict[str, list|True] and list[dict]")


        elif value is True:
            print('True')
            act(tree, key)

        else:
            raise Exception("Only valid values in to_act are dict[str, list[dict]|True|dict[^]] and list[dict[str, list[^^]|True|dict[^]]]")
