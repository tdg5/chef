name('clojure')
description('Role for nodes with clojure')
run_list([
  'role[java]',
  'recipe[leiningen]',
])
