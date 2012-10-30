name 'base'
description 'Base role applied to all nodes.'
run_list [
		'recipe[vim]',
		'recipe[tmux]',
		'recipe[htop]',
		'recipe[apt]',
		'recipe[openssh]',
		'recipe[rvm::user]',
]
default_attributes({
		'rvm' => {
				'branch' => 'none',
				'rvmrc' => {
						'rvm_trust_rvmrcs_flag' => 1,
				},
				'version' => '1.16.16',
				'user_installs' => [{
						'user' => 'danny',
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

})
