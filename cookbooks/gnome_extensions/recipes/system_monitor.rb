extension_dir = "/home/#{node.user.username}/.local/share/gnome-shell/extensions/system-monitor@paradoxxx.zero.gmail.com"

%w[gir1.2-gtop-2.0 gir1.2-networkmanager-1.0].each { |pkg| package pkg }

remote_directory extension_dir do
	files_group node.user.group
	files_owner node.user.username
	files_mode '0644'
end
