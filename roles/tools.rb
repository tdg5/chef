name 'tools'
description 'Role with various tools'
run_list [
	'recipe[iftop]',
	'recipe[iotop]',
]
default_attributes({})
