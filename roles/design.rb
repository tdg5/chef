name 'design'
description 'Role for design tools'
run_list [
	'role[base]',
	'recipe[gimp]',
	'recipe[fonts]',
]
default_attributes({})
