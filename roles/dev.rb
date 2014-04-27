name 'dev'
description 'Role for dev tools'
run_list [
  'role[base]',
  'role[rvm]',
  'role[nodejs]',
  'recipe[gitk]',
  'recipe[tmuxinator]',
  'recipe[postgresql::server]',
  'role[tools]',
]
default_attributes({})
