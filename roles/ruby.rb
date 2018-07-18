name 'ruby'
description 'Role for nodes with Ruby'
run_list [
  'recipe[ruby]',
  'recipe[config::irb]',
]
default_attributes({})
