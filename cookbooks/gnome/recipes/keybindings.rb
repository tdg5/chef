code = []
user_gconf_config_source = "xml::/home/#{node.user.username}/.gconf"

node.gnome.keybindings.each_with_index do |keybinding, index|
  if GnomeVersion.gnome_version_constraint('< 3.4')
    existing_value = `gconftool --config-source #{user_gconf_config_source} --get /desktop/gnome/keybindings/custom#{index}/name`.strip
    next if existing_value == keybinding[0]
    code << "gconftool --config-source #{user_gconf_config_source} --set /desktop/gnome/keybindings/custom#{index}/name --type string '#{keybinding[0]}'"
    code << "gconftool --config-source #{user_gconf_config_source} --set /desktop/gnome/keybindings/custom#{index}/action --type string '#{keybinding[1]['action']}'"
    code << "gconftool --config-source #{user_gconf_config_source} --set /desktop/gnome/keybindings/custom#{index}/binding --type string '#{keybinding[1]['binding']}'"
  else
    # dconf returns quoted expression
    existing_value = `dconf read /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom#{index}/name`.strip.gsub(/(^'|'$)/, '')
    next if existing_value == keybinding[0]
    code << "dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom#{index}/name \"'#{keybinding[0]}'\""
    code << "dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom#{index}/command \"'#{keybinding[1]['action']}'\""
    code << "dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom#{index}/binding \"'#{keybinding[1]['binding']}'\""
  end
end

gconf_code = code.join(' && ')
bash 'install_keybindings' do
  code gconf_code
  user node.user.username
  not_if { code.empty? }
end
