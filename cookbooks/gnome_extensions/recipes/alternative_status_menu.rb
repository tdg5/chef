extension_dir = "/home/#{node.user.username}/.local/share/gnome-shell/extensions/alternative-status-menu@gnome-shell-extensions.gcampax.github.com"
remote_directory extension_dir do
	files_group node.user.group
	files_owner node.user.username
	files_mode '0644'
end
