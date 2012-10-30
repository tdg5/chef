name 'lk'
description 'Role for leadkarma specifics'
run_list [
	'role[base]',
]
user = 'danny.guinther'
group = 'danny.guinther'
default_attributes({
	'group' => group,
	'rvm' => {
		'branch' => 'none',
		'rvmrc' => {
			'rvm_trust_rvmrcs_flag' => 1,
		},
		'version' => '1.16.16',
		'user_installs' => [{
			'user' => user,
			'default_ruby' => '1.9.3-p286',
			'rubies' => ['1.9.3-p286'],
			'gems' => {
				'1.9.3-p286' => [{
					'name' => 'chef',
					'version' => '10.14.0',
				},],
			},
		},],
	},
	'user' => user,
})

