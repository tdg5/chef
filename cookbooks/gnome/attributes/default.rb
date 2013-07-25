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
}
