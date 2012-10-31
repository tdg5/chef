name 'base'
description 'Base role applied to all nodes.'
run_list [
		'recipe[config::bash]',
		'recipe[config::gnome-terminal]',
		'recipe[config::git]',
		'recipe[vim]',
		'recipe[vim-gnome]',
		'recipe[config::vim]',
		'recipe[tmux]',
		'recipe[config::tmux]',
		'recipe[htop]',
		'recipe[apt]',
		'recipe[openssh]',
		'recipe[chrome]',
]
