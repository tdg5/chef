name 'videos'
description 'Role for various video software'
run_list [
	'recipe[handbrake]',
]
default_attributes({})
