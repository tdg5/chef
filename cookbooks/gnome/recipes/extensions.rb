extensions = %w[
	alternative-status-menu@gnome-shell-extensions.gcampax.github.com
	impatience@gfxmonk.net
	mediaplayer@patapon.info
	nohotcorner@azuri.free.fr
	places-menu@gnome-shell-extensions.gcampax.github.com
	RecentItems@bananenfisch.net
	removeaccesibility@lomegor
	system-monitor@paradoxxx.zero.gmail.com
	antisocial-menu@cnervi.github.com
	status-area-horizontal-spacing@mathematical.coffee.gmail.com
]

%w[gir1.2-gtop-2.0 gir1.2-networkmanager-1.0].each {|pkg| package pkg}

extensions.each do |extension|
	extension_dir = "/home/#{node.user.username}/.local/share/gnome-shell/extensions/#{extension}"

	remote_directory extension_dir do
		files_group node.user.group
		files_owner node.user.username
		files_mode '0644'
		source "extensions/#{extension}"
	end
end
