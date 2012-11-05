include_recipe 'virtualbox'

user node.vagrant.user do
	gid node.vagrant.group
	shell '/bin/false'
end

rvm_gem 'vagrant' do
	action :install
	ruby_string node.vagrant.ruby_string
	user node.vagrant.user
end
