name('clojure')
description('Role for nodes with clojure')
run_list([
  'role[java]',
  'recipe[leiningen]',
])
default_attributes({
  'lein' => {
    'group' => 'tdg5',
    'home' => '/home/tdg5',
    'user' => 'tdg5',
  },
})

