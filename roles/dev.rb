name 'dev'
description 'Role for dev tools'
run_list [
  'role[base]',
  'role[rvm]',
  'role[nodejs]',
  'role[clojure]',
  'role[tools]',
]
default_attributes({})
