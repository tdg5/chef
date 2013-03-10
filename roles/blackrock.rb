name 'blackrock'
description 'Role for blackrock specifics'
run_list [
	'role[base]',
	'recipe[grub::blackrock]',
	'recipe[filesystem_layout::blackrock]',
	'recipe[vgaswitcheroo]',
	'recipe[modprobe]',
	'role[tools]',
	'role[video]',
	'role[design]',
	'role[dev]',
	'role[rvm]',
	'role[vm_host]',
	'recipe[audacity]',
	'recipe[java]',
	'recipe[modprobe::blackrock_alsa]',
	'recipe[pulseaudio::blackrock_alsa_mixer]',
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
		:default_ruby => '1.9.3-p392',
		:gems => {
			'1.9.3-p392' => [{
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
})

