

# This act function will delete the keys that have True as their value in the to_act object if the
def deleteItem(tree, key):
    del tree[key]

# This function will create a addValue act function for act on keys, adding the value passed in.
def createAddValueAct(value):
  def addValue(tree, key):
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
# }
#
# In this example we will use the deleteItem act function
# actOnKeys(tree, to_delete, deleteItem)
# resulting object:
# {
#   'a': {
#     'b': {
#       'something-else': {
#         'id': 1
#       },
#     },
#     'data': [
#       12,
#       34,
#     ],
#   },
#   'c': {
#     'd': {
#       'data': [1, 2, 3]
#     }
#   }
# }
def actOnKeys(tree, to_act, act):
    for key, value in to_act.items():
        if type(value) is dict:
            tree_value = tree.get(key)

            if type(tree_value) is not dict:
                #skip keys that don't exist in tree
                continue

            actOnKeys(tree_value, value, act)

        elif value is True:
            act(tree, key)

        else:
            raise Exception("Only valid values in to_act are dictionaries and True")
