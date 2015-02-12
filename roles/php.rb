name 'php'
description 'Role for nodes with PHP'
run_list [
  'recipe[composer]',
]
# default_attributes({})
