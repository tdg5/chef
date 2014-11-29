name 'base'
description 'Base role applied to all nodes.'
run_list [
  'recipe[lib]',
  'recipe[bash_config]',
  'recipe[config::git]',
  'recipe[config::sshagent]',
  'recipe[vim]',
  'recipe[vim_plugins]',
  'recipe[config::vim]',
  'recipe[tmux_wrapper]',
  'recipe[tmux_plugins]',
  'recipe[xclip]',
  'recipe[htop]',
  'recipe[apt]',
  'recipe[openssh]',
  'recipe[wmctrl]',
  'recipe[chrome]',
  'recipe[spotify]',
  'recipe[pidgin]',
  'recipe[gnome]',
  'recipe[dropbox]',
  'recipe[skype]',
  'recipe[screenlets]',
  'role[java]',
  'recipe[adb]',
]
default_attributes({})
