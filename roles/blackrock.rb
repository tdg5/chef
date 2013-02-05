name 'blackrock'
description 'Role for blackrock specifics'
run_list [
	'role[base]',
	'recipe[config::filesystem_layout]',
]
user = group = 'tdg5'
default_attributes({
	'user' => {
		'username' => user,
		'email' => 'dannyguinther@gmail.com',
		'group' => group,
	},
})

