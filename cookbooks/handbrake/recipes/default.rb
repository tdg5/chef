apt_repository 'handbrake' do
	components ['main', 'precise']
	key '816950D8'
	keyserver 'server keyserver.ubuntu.com'
	uri 'http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu'
end

package 'handbrake-gtk'
