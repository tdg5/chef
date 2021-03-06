default['gnome']['extensions'] = {
# :mediaplayer => {
#   :git => 'https://github.com/eonpatapon/gnome-shell-extensions-mediaplayer.git',
#   :install_script => {
#     :code => './autogen.sh; make install-zip',
#   },
#   :name => 'mediaplayer@patapon.info',
#   :revision => '2cb5d6da4023c6e563fecdcc173dfcbc0c43cb67',
# },
# :no_hot_corner => {
#   :git => 'https://github.com/HROMANO/nohotcorner.git',
#   :name => 'nohotcorner@azuri.free.fr',
#   :revision => '930bb8bca3d2bd66fed87c860e4392341dcbf5ab',
# },
# :places_menu => {
#   :name => 'places-menu@gnome-shell-extensions.gcampax.github.com',
# },
# :system_monitor => {
#   :git => 'https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git',
#   :link => {
#     :src_path => 'system-monitor@paradoxxx.zero.gmail.com',
#   },
#   :name => 'system-monitor@paradoxxx.zero.gmail.com',
#   :revision => '8b31f070e9e59109d729661ced313d6a63e31787',
# },
# :randomwall => {
#   :git => 'https://github.com/rodakorn/randwall.git',
#   :link => {
#     :src_path => 'Random_Walls@Antares',
#   },
#   :name => 'Random_Walls@Antares',
#   :revision => '8f22597b0a88722c88a65e0480440d3bc8fa18cf',
# },
}

default['gnome']['settings'] = {
  :clock_format => {
    :key => 'clock-format',
    :schema => 'org.gnome.desktop.interface',
    :user => node['user']['username'],
    :value => '12h',
  },
  :show_desktop_icons => {
    :key => 'show-desktop-icons',
    :schema => 'org.gnome.desktop.background',
    :user => node['user']['username'],
    :value => true,
  },
  :favorite_apps => {
    :key => 'favorite-apps',
    :schema => 'org.gnome.shell',
    :user => node['user']['username'],
    :value => [
      'google-chrome.desktop',
      'pidgin.desktop',
      'spotify.desktop',
      'rhythmbox.desktop',
      'nautilus.desktop',
      'gnome-terminal.desktop',
      'gimp.desktop',
      'virtualbox.desktop',
      'firefox.desktop',
    ],
  },
  :idle_delay => {
    :key => 'idle-delay',
    :schema => 'org.gnome.desktop.session',
    :user => node['user']['username'],
    :value => 300,
  },
  :include_minimize_and_maximize_on_windows => {
    :key => 'button-layout',
    :schema => 'org.gnome.shell.overrides',
    :user => node['user']['username'],
    :value => ':minimize,maximize,close',
  },
  :launch_chrome_incognito_keybinding_binding => {
    :key => 'binding',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => '<Primary><Shift><Alt>b',
  },
  :launch_chrome_incognito_keybinding_command => {
    :key => 'command',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => 'new_chrome_with_focus --incognito',
  },
  :launch_chrome_incognito_keybinding_name => {
    :key => 'name',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => 'Launch Chrome Incognito',
  },
  :launch_chrome_keybinding_binding => {
    :key => 'binding',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => '<Primary><Alt>b',
  },
  :launch_chrome_keybinding_command => {
    :key => 'command',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => 'new_chrome_with_focus',
  },
  :launch_chrome_keybinding_name => {
    :key => 'name',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => 'Launch Chrome',
  },
  :launch_terminal_keybinding_binding => {
    :key => 'binding',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => '<Primary><Alt>t',
  },
  :launch_terminal_keybinding_command => {
    :key => 'command',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => 'x-terminal-emulator',
  },
  :launch_terminal_keybinding_name => {
    :key => 'name',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => 'Launch Terminal',
  },
  :lid_close_ac => {
    :key => 'lid-close-ac-action',
    :schema => 'org.gnome.settings-daemon.plugins.power',
    :user => node['user']['username'],
    :value => 'nothing',
  },
  :lid_close_battery => {
    :key => 'lid-close-battery-action',
    :schema => 'org.gnome.settings-daemon.plugins.power',
    :user => node['user']['username'],
    :value => 'nothing',
  },
  :lock_on_suspend => {
    :key => 'ubuntu-lock-on-suspend',
    :schema => 'org.gnome.desktop.screensaver',
    :user => node['user']['username'],
    :value => true,
  },
  :move_to_workspace_down_keybindings => {
    :key => 'move-to-workspace-down',
    :schema => 'org.gnome.desktop.wm.keybindings',
    :user => node['user']['username'],
    :value => [
      '<Control><Shift><Alt>Down',
      '<Control><Shift><Alt>j',
    ],
  },
  :move_to_workspace_up_keybindings => {
    :key => 'move-to-workspace-up',
    :schema => 'org.gnome.desktop.wm.keybindings',
    :user => node['user']['username'],
    :value => [
      '<Control><Shift><Alt>Up',
      '<Control><Shift><Alt>k',
    ],
  },
  :show_date_in_clock => {
    :key => 'clock-show-date',
    :schema => 'org.gnome.desktop.interface',
    :user => node['user']['username'],
    :value => true,
  },
  :show_seconds_in_clock => {
    :key => 'clock-show-seconds',
    :schema => 'org.gnome.desktop.interface',
    :user => node['user']['username'],
    :value => true,
  },
  :suspend_keybinding_binding => {
    :key => 'binding',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => '<Primary><Shift><Alt>s',
  },
  :suspend_keybinding_command => {
    :key => 'command',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => 'dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend',
  },
  :suspend_keybinding_name => {
    :key => 'name',
    :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/',
    :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
    :user => node['user']['username'],
    :value => 'Suspend',
  },
  :switch_to_workspace_down_keybinding => {
    :key => 'switch-to-workspace-down',
    :schema => 'org.gnome.desktop.wm.keybindings',
    :user => node['user']['username'],
    :value => [
      '<Control><Alt>Down',
      '<Control><Alt>j',
    ],
  },
  :switch_to_workspace_up_keybinding => {
    :key => 'switch-to-workspace-up',
    :schema => 'org.gnome.desktop.wm.keybindings',
    :user => node['user']['username'],
    :value => [
      '<Control><Alt>Up',
      '<Control><Alt>k',
    ],
  },
}

default['gnome']['wallpapers'] = {
  :manifest_path => '/usr/local/share/gnome-background-properties/gnome-wallpapers.xml',
  :update_script_path => '/usr/local/sbin/update_gnome_wallpapers_manifest',
  :wallpaper_dirs => [
    "/home/#{node['user']['username']}/Pictures/wallpapers",
  ],
}
