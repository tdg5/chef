name 'rvm'
description 'Role for nodes with RVM/Ruby'
run_list [
	'recipe[rvm::system]',
]
default_attributes({})
