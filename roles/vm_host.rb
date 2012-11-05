name 'vm_host'
description 'Role for VirtualBox based vm host'
run_list [
	'recipe[virtualbox]',
	'recipe[vagrant]',
	'recipe[veewee]',
]
