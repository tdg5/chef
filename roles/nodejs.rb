name 'nodejs'
description 'Role for nodejs related tools'
run_list [
  'recipe[nodejs]',
  'recipe[nodejs::npm]',
  'recipe[npm]',
  'recipe[grunt]',
  'recipe[jsonlint]',
]
npm_version = '1.3.11'
default_attributes({
  :nodejs => {
    :npm => npm_version,
  },
  :npm => {
    :version => npm_version,
  }
})
