name 'base'
description 'Base role applied to all nodes.'
run_list [
		'recipe[config::bash]',
		'recipe[config::git]',
		'recipe[config::sshagent]',
		'recipe[vim]',
		'recipe[vim_plugins]',
		'recipe[config::vim]',
		'recipe[tmux]',
		'recipe[config::tmux]',
		'recipe[htop]',
		'recipe[apt]',
		'recipe[openssh]',
		'recipe[chrome]',
		'recipe[spotify]',
		'recipe[pidgin]',
		'recipe[gnome]',
		'recipe[dropbox]',
		'recipe[ubuntuone]',
]
default_attributes({
	:gnome => {
		:keybindings => {
			'Launch Terminal' => {
				'action' => 'x-terminal-emulator',
				'binding' => '<Primary><Alt>t',
			},
			'Launch Chrome' => {
				'action' => 'google-chrome',
				'binding' => '<Primary><Alt>b',
			},
			'Launch Chrome Incognito' => {
				'action' => 'google-chrome --incognito',
				'binding' => '<Primary><Shift><Alt>b',
			},
		},
	},
})
