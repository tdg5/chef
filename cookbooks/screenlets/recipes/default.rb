apt_repository 'screenlets-ppa-precise' do
	components ['main']
	distribution node.lsb.codename
	keyserver 'keyserver.ubuntu.com'
	uri 'http://ppa.launchpad.net/screenlets/ppa/ubuntu'
end

package 'screenlets'
