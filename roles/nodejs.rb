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
    :version => '0.10.31',
  },
})
