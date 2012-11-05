include_recipe 'vagrant'

veewee_path = node.veewee.path

directory veewee_path do
	action :create
	owner node.vagrant.user
	group node.vagrant.group
end

git veewee_path do
	action :sync
	group node.vagrant.group
	reference '1ac899dd8cb3f46491157ccca7c4ed1fb89e17c1'
	repository 'https://github.com/jedi4ever/veewee.git'
	user node.vagrant.user
end

[
	veewee_iso_path = ::File.join(veewee_path, 'iso'),
	definitions_path = ::File.join(veewee_path, 'definitions'),
].each do |dir|
	directory dir do
		action :create
		owner node.vagrant.user
		group node.vagrant.group
	end
end

rvm_shell 'bundle install' do
	action :run
	code 'bundle install'
	cwd veewee_path
	ruby_string node.vagrant.ruby_string
	user node.vagrant.user
end