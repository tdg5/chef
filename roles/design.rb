name 'design'
description 'Role for design tools'
run_list [
  'role[base]',
  'recipe[fonts]',
  'recipe[gimp]',
  'recipe[image_tools]',
]
default_attributes({})
