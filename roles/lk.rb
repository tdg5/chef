name 'lk'
description 'Role for leadkarma specifics'
run_list [
	'role[base]',
	'recipe[rvm::user]',
	'recipe[mysql::server]',
	'recipe[mysql::client]',
	'recipe[redis::server]',
	'recipe[geoip]',
	'recipe[qt::dev]',
	'role[vm_host]',
]
user = group = 'danny.guinther'
default_attributes({
	'mysql' => {
		'server_root_password' => 'mysql',
		'server_repl_password' => 'mysql',
		'server_debian_password' => 'mysql'
	},
	'rvm' => {
		'branch' => 'none',
		'rvmrc' => {
			'rvm_trust_rvmrcs_flag' => 1,
		},
		'version' => '1.16.16',
		'user_installs' => [{
			'user' => user,
			'default_ruby' => '1.9.3-p286',
			'rubies' => ['1.9.3-p286', '1.9.3-p194'],
			'gems' => {
				'1.9.3-p286' => [{
					'name' => 'chef',
					'version' => '10.14.0',
				},],
			},
		},],
	},
	'vagrant' => {
		'group' => group,
		'user' => user,
	},
	'user' => {
		'username' => user,
		'email' => 'danny.guinther@leadkarma.com',
		'group' => group,
	}
})

