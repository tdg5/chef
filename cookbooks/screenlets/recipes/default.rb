apt_repository 'screenlets-ppa-precise' do
	components ['main']
	distribution node.lsb.codename
	keyserver 'keyserver.ubuntu.com'
	not_if 'apt-cache policy | grep -q screenlets/ppa/ubuntu'
	uri 'http://ppa.launchpad.net/screenlets/ppa/ubuntu'
end

package 'screenlets'
