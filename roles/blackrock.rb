name 'blackrock'
description 'Role for blackrock specifics'
run_list [
	'role[base]',
	'recipe[grub::blackrock]',
	'recipe[config::filesystem_layout]',
	'role[design]',
	'role[dev]',
	'role[rvm]',
	'role[vm_host]',
	'recipe[audacity]',
]
user = group = 'tdg5'
default_attributes({
	'user' => {
		'username' => user,
		'email' => 'dannyguinther@gmail.com',
		'group' => group,
	},
	'vagrant' => {
		'group' => 'rvm',
		'user' => 'tdg5',
	}
})

