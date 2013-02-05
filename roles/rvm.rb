name 'rvm'
description 'Role for nodes with RVM/Ruby'
run_list [
	'recipe[rvm::system]',
]
default_attributes({
	:rvm => {
		:branch => 'none',
		:rvmrc => {
			:rvm_trust_rvmrcs_flag => 1,
		},
		:version => '1.17.2',
		:default_ruby => '1.9.3-p327',
		:gems => {
			'1.9.3-p327' => [{
				:name => 'chef',
				:version => '10.16.4',
			},],
		},
	},
})
