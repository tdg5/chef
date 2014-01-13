apt_repository 'gimp' do
  components ['main']
  distribution node.lsb.codename
  key '614C4B38'
  keyserver 'keyserver.ubuntu.com'
  not_if 'apt-cache policy | grep -q otto-kesselgulasch/gimp'
  uri 'http://ppa.launchpad.net/otto-kesselgulasch/gimp/ubuntu'
end

%w[gimp gimp-plugin-registry gimp-gmic].each { |pkg| package pkg }
