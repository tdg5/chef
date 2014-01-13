apt_repository 'handbrake' do
  components ['main']
  distribution node.lsb.codename
  key '816950D8'
  keyserver 'keyserver.ubuntu.com'
  not_if 'apt-cache policy | grep -q stebbins/handbrake-releases'
  uri 'http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu'
end

package 'handbrake-gtk'
