# vi:ft=ruby:
source 'https://api.berkshelf.com'

def dependencies(path)
  berks = "#{path}/Berksfile.in"
  instance_eval(File.read(berks)) if File.exists?(berks)
end

# Load local cookbooks
Dir.glob('./local_cookbooks/*').each do |path|
  dependencies path
  cookbook File.basename(path), :path => path
end

cookbook 'android-sdk', :git => 'https://github.com/gildegoma/chef-android-sdk'
cookbook 'ant', :git => 'https://github.com/opscode-cookbooks/ant.git'
cookbook 'apt', :git => 'https://github.com/opscode-cookbooks/apt.git'
cookbook 'ark', :git => 'https://github.com/opscode-cookbooks/ark.git'
cookbook 'build-essential', :git => 'https://github.com/opscode-cookbooks/build-essential.git'
cookbook 'docker', :git => 'https://github.com/bflad/chef-docker.git'
cookbook 'chef_gem', :git => 'https://github.com/hw-cookbooks/chef_gem.git'
cookbook 'database', :git => 'https://github.com/opscode-cookbooks/database.git'
cookbook 'ddclient', :git => 'https://github.com/freewrite-cookbooks/ddclient.git'
cookbook 'gnome_setting', :git => 'https://github.com/tdg5-cookbooks/gnome_setting.git'
cookbook 'hostsfile', :git => 'https://github.com/customink-webops/hostsfile.git'
cookbook 'iptables', :git => 'https://github.com/opscode-cookbooks/iptables.git'
cookbook 'java', :git => 'https://github.com/tdg5/chef_java.git'
cookbook 'lib', :git => 'https://github.com/freewrite-cookbooks/lib.git'
cookbook 'modules', :git => 'git@github.com:tdg5/modules-cookbook.git', :branch => 'ubuntu-debian-fixes'
cookbook 'mysql', :git => 'https://github.com/opscode-cookbooks/mysql.git'
cookbook 'nodejs', :git => 'https://github.com/redguide/nodejs.git'
cookbook 'openssh', :git => 'https://github.com/opscode-cookbooks/openssh.git'
cookbook 'openssl', :git => 'https://github.com/opscode-cookbooks/openssl.git'
cookbook 'packer', :git => 'https://github.com/tdg5/chef-packer'
cookbook 'postgresql', :git => 'https://github.com/freewrite-cookbooks/postgresql.git'
cookbook 'rvm', :git => 'https://github.com/fnichol/chef-rvm.git'
cookbook 'tmux', :git => 'https://github.com/stevendanna/tmux'
cookbook 'vagrant', :git => 'https://github.com/tdg5/vagrant-cookbook.git'
cookbook 'vim', :git => 'https://github.com/opscode-cookbooks/vim.git'
