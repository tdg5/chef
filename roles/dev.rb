name 'dev'
description 'Role for dev tools'
run_list [
  'role[base]',
  'role[ruby]',
  'role[nodejs]',
  'role[clojure]',
  'role[tools]',
]
default_attributes({})
