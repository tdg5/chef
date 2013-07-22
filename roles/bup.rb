name 'bup'
description 'Role for bup specifics'
run_list [
	'recipe[lib]',
	'role[base]',
	'recipe[rvm]',
	#'role[vm_host]',
	'recipe[postgresql::server]',
	'recipe[qt::dev]',
	'role[design]',
	'role[dev]',
]
user = group = 'danny'
default_attributes({
	:postgresql => {
		:config => {
			:listen_addresses => 'localhost',
		},
		:pg_hba => [
			{
				:db => 'all',
				:method => 'md5',
				:type => 'local',
				:user => 'postgres',
			},
		],
		:super_user => {
			:password => 'postgresql',
			:username => 'postgresql',
		},
	},
	'rvm' => {
		'branch' => 'none',
		'default_ruby' => '',
		'rubies' => [
			{
				'version' => '1.9.3-p385',
				'patch' => 'falcon',
			},
		],
		'rvmrc' => {
			'rvm_trust_rvmrcs_flag' => 1,
		},
		'version' => '1.18.6',
	},
	'user' => {
		'username' => user,
		'email' => 'danny@backupify.com',
		'group' => group,
	}
})

