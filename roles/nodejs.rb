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
      :checksum => 'a8a2d4b74734991dd45e5b2b0b13617864f1283f6d6bc262e1e4d30741114352',
    },
    :version => '6.8.0',
  },
})
