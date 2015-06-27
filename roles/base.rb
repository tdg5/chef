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
  'recipe[thunar]',
  'recipe[dropbox]',
  'recipe[skype]',
  'recipe[screenlets]',
  'role[java]',
  'recipe[adb]',
  'recipe[liquidprompt]',
  'recipe[config::mime_applications]',
]
default_attributes({
  'bash' => {
    'bashrc' => {
      'extra_sources' => {
        'Alias definitions' => '~/.bash_aliases',
        'SSH Agent config and keys' => '~/.sshagentrc',
        'liquidprompt' => '/opt/liquidprompt/liquidprompt',
      },
    },
  },
})
