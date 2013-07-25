code = ''
user_gconf_config_source = "xml::/home/#{node.user.username}/.gconf"

node.gnome.keybindings.each_with_index do |keybinding, index|
	existing_value = `gconftool --config-source #{user_gconf_config_source} --get /desktop/gnome/keybindings/custom#{index}/name`.strip
	next if existing_value = keybinding[0]
	code += "gconftool --config-source #{user_gconf_config_source} --set /desktop/gnome/keybindings/custom#{index}/name --type string '#{keybinding[0]}' && "
	code += "gconftool --config-source #{user_gconf_config_source} --set /desktop/gnome/keybindings/custom#{index}/action --type string '#{keybinding[1]['action']}' && "
	code += "gconftool --config-source #{user_gconf_config_source} --set /desktop/gnome/keybindings/custom#{index}/binding --type string '#{keybinding[1]['binding']}' && "
end

unless code.empty?
	gconf_code = code[0, code.length - 4]
	bash 'install_keybindings' do
		code gconf_code
		user node.user.username
	end
end
