name 'tools'
description 'Role with various tools'
run_list [
  'recipe[iftop]',
  'recipe[iotop]',
  'recipe[tree]',
]
default_attributes({})
