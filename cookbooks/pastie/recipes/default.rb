apt_repository 'pastie' do
  components ['main']
  distribution node.lsb.codename
  keyserver 'keyserver.ubuntu.com'
  key 'DE4CA452'
  uri 'http://ppa.launchpad.net/hel-sheep/pastie/ubuntu'
  not_if "apt-cache policy | grep -q 'hel-sheep'"
end

package 'pastie'
