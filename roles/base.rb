name 'base'
description 'Base role applied to all nodes.'
run_list [
		'recipe[config::bash]',
		'recipe[vim]',
		'recipe[config::vim]',
		'recipe[tmux]',
		'recipe[config::tmux]',
		'recipe[htop]',
		'recipe[apt]',
		'recipe[openssh]',
		'recipe[rvm::user]',
]
