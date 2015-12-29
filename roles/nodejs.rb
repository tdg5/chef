name 'nodejs'
description 'Role for nodejs related tools'
run_list [
  'recipe[nodejs]',
  'recipe[nodejs::npm]',
  'recipe[grunt]',
  'recipe[jsonlint]',
]
default_attributes({
  :nodejs => {
    :install_method => 'source',
    :source => {
      :checksum => 'cc05ff06149c638345835788f448471d264a7e011bf083394f86d5be51975c7e',
    },
    :version => '5.3.0',
  },
})
