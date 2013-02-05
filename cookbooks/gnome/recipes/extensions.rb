extensions = %w[
	alternative-status-menu@gnome-shell-extensions.gcampax.github.com
	system-monitor@paradoxxx.zero.gmail.com
	places-menu@gnome-shell-extensions.gcampax.github.com
	removeaccesibility@lomegor
	nohotcorner@azuri.free.fr
	mediaplayer@patapon.info
	RecentItems@bananenfisch.net
]

extensions.each do |extension|
	extension_dir = "/home/#{node.user.username}/.local/share/gnome-shell/extensions/#{extension}"

	remote_directory extension_dir do
		files_group node.user.group
		files_owner node.user.username
		files_mode '0644'
		source "extensions/#{extension}"
	end
end
