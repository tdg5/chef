name 'bup'
description 'Role for bup specifics'
run_list [
	'recipe[lib]',
	'role[base]',
	'role[rvm]',
	#'role[vm_host]',
	'recipe[postgresql::server]',
	'recipe[qt::dev]',
	'role[design]',
	'role[dev]',
	'recipe[java]',
	'recipe[bup_wrapper]',
	'recipe[hipchat]',
]
user = group = 'danny'
default_attributes({
	:config => {
		:bashrc => {
			:extra_sources => [
				'~/scripts/ec2env',
			],
		},
	},
	:postgresql => {
		:config => {
			:listen_addresses => 'localhost',
		},
		:super_user => {
			:password => 'postgres',
			:username => 'postgres',
		},
	},
	'rvm' => {
		'branch' => 'none',
		'default_ruby' => '',
		:global_gems => [{
			:name => 'gem-ctags',
		}, {
			:name => 'chef',
			:version => '11.2.0',
		}, {
			:name => 'bundler'
		},],
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

override_attributes({
	:postgresql => {
		:pg_hba => [
			{
				:db => 'all',
				:method => 'md5',
				:type => 'local',
				:user => 'postgres',
			},
		],
	},
})
