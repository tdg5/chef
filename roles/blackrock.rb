name 'blackrock'
description 'Role for blackrock specifics'
run_list [
	'role[base]',
	'recipe[config::filesystem_layout]',
	'role[design]',
	'role[dev]',
	'recipe[audacity]',
]
user = group = 'tdg5'
default_attributes({
	'user' => {
		'username' => user,
		'email' => 'dannyguinther@gmail.com',
		'group' => group,
	},
})

