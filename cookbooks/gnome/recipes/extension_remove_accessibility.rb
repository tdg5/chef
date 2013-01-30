extension_dir_name = 'removeaccesibility@lomegor'
extension_dir = "/home/#{node.user.username}/.local/share/gnome-shell/extensions/#{extension_dir_name}"

remote_directory extension_dir do
	files_group node.user.group
	files_owner node.user.username
	files_mode '0644'
	source "extensions/#{extension_dir_name}"
end
