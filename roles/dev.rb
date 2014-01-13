name 'dev'
description 'Role for dev tools'
run_list [
  'role[base]',
  'recipe[gitk]',
]
default_attributes({})
