name 'blackrock'
description 'Role for blackrock specifics'
run_list [
	'role[base]',
	'recipe[grub::blackrock]',
	'recipe[config::filesystem_layout]',
	'recipe[modprobe]',
	'role[design]',
	'role[dev]',
	'role[rvm]',
	'role[vm_host]',
	'recipe[audacity]',
]
user = group = 'tdg5'
default_attributes({
	:modprobe => {
		:blacklists => [
		],
	},
	:rvm => {
		:branch => 'none',
		:rvmrc => {
			:rvm_trust_rvmrcs_flag => 1,
		},
		:version => '1.18.6',
		:default_ruby => '1.9.3-p385',
		:gems => {
			'1.9.3-p385' => [{
				:name => 'chef',
				:version => '11.2.0',
			}, {
				:name => 'bundler'
			}],
		},
	},
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

