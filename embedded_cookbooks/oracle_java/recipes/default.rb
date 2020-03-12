%w[software-properties-common debconf-utils wget curl].each do |pkg|
  package pkg
end

bash 'accept_license_agreement' do
  code 'echo oracle-java13-installer shared/accepted-oracle-license-v1-2 select true | debconf-set-selections'
end

apt_repository 'linuxuprising-ubuntu-java-bionic' do
  components ['main']
  key '73C3DB2A'
  keyserver 'keyserver.ubuntu.com'
  not_if 'apt-cache policy | grep -q linuxuprising'
  uri 'http://ppa.launchpad.net/linuxuprising/java/ubuntu'
end

package 'oracle-java13-set-default'
