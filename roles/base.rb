name 'base'
description 'Base role applied to all nodes.'
run_list [
  'recipe[lib]',
  'recipe[bash]',
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
default_attributes({
  :gnome => {
    :keybindings => {
      'Launch Terminal' => {
        'action' => 'x-terminal-emulator',
        'binding' => '<Primary><Alt>t',
      },
      'Launch Chrome' => {
        'action' => 'new_chrome_with_focus',
        'binding' => '<Primary><Alt>b',
      },
      'Launch Chrome Incognito' => {
        'action' => 'new_chrome_with_focus --incognito',
        'binding' => '<Primary><Shift><Alt>b',
      },
      'Suspend' => {
        'action' => 'dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend',
        'binding' => '<Primary><Shift><Alt>s',
      },
    },
  },
})
