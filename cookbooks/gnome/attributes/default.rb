default.gnome = {
  :gsettings => [{
    :key => 'favorite-apps',
    :schema => 'org.gnome.shell',
    :value => "['google-chrome.desktop', 'pidgin.desktop', 'spotify.desktop', 'rhythmbox.desktop', 'nautilus.desktop', 'gnome-terminal.desktop', 'gimp.desktop', 'virtualbox.desktop', 'firefox.desktop']",
  }, {
    :key => 'move-to-workspace-down',
    :schema => 'org.gnome.desktop.wm.keybindings',
    :value => "['<Control><Shift><Alt>Down', '<Control><Shift><Alt>j']",
  }, {
    :key => 'move-to-workspace-up',
    :schema => 'org.gnome.desktop.wm.keybindings',
    :value => "['<Control><Shift><Alt>Up', '<Control><Shift><Alt>k']",
  }, {
    :key => 'switch-to-workspace-up',
    :schema => 'org.gnome.desktop.wm.keybindings',
    :value => "['<Control><Alt>Up', '<Control><Alt>k']",
  }, {
    :key => 'switch-to-workspace-down',
    :schema => 'org.gnome.desktop.wm.keybindings',
    :value => "['<Control><Alt>Down', '<Control><Alt>j']",
  },],
  :wallpapers => {
    :manifest_path => '/usr/local/share/gnome-background-properties/gnome-wallpapers.xml',
    :update_script_path => '/usr/local/sbin/update_gnome_wallpapers_manifest',
    :wallpaper_dirs => [
      '/home/tdg5/Pictures/wallpapers',
    ],
  },
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
}
