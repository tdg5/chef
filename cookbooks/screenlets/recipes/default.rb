if node['platform'] == 'ubuntu' && Chef::VersionConstraint.new('<= 12.04').include?(node['platform_version'])
  apt_repository 'screenlets-ppa-precise' do
    components ['main']
    distribution node.lsb.codename
    keyserver 'keyserver.ubuntu.com'
    key 'A8670E8C'
    not_if 'apt-cache policy | grep -q screenlets/ppa/ubuntu'
    uri 'http://ppa.launchpad.net/screenlets/ppa/ubuntu'
  end
end

package 'screenlets'
