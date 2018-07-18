name 'nodejs'
description 'Role for nodejs related tools'
run_list [
  'recipe[nodejs]',
  'recipe[nodejs::npm]',
  'recipe[jsonlint]',
]
default_attributes({
  :nodejs => {
    :install_method => 'package',
    :install_repo => true,
    :repo => 'https://deb.nodesource.com/node_8.x',
  },
})
