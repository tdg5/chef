name 'bup'
description 'Role for bup specifics'
run_list [
	'recipe[lib]',
	'role[base]',
	'role[rvm]',
	'role[vm_host]',
	'recipe[postgresql::server]',
	'recipe[qt::dev]',
	'role[design]',
	'role[dev]',
	'recipe[java]',
	'recipe[bup_wrapper]',
	'recipe[hipchat]',
]
user = group = 'danny'
global_gems = [{
	:name => 'gem-ctags',
}, {
	:name => 'chef',
	:version => '11.2.0',
}, {
	:name => 'bundler'
}]
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
    'gems' => {
      '1.9.3-p385' => global_gems,
      '2.0.0-p247' => global_gems,
    },
		'rubies' => [
			{
				'version' => '1.9.3-p385',
				'patch' => 'falcon',
			},
			'2.0.0-p247',
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
        :addr => '127.0.0.1/32',
        :db => 'all',
        :method => 'trust',
        :type => 'host',
        :user => 'postgres',
      },
			{
				:db => 'all',
				:method => 'md5',
				:type => 'local',
				:user => 'postgres',
			},
		],
	},
})
