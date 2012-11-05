include_recipe 'virtualbox'

rvm_environment node.vagrant.ruby_string do
	action :create
	user node.vagrant.user
end


rvm_gem 'vagrant' do
	action :install
	ruby_string node.vagrant.ruby_string
	user node.vagrant.user
end
