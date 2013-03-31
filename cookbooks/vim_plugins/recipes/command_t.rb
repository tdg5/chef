include_recipe 'ruby1.8'

command_t_dir = "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/command_t"
git command_t_dir do
	group node.user.group
	notifies :run, 'bash[build_command_t]'
	repository 'https://github.com/wincent/Command-T.git'
	revision 'd30099cac79dfdbc4a16d8279c5a2304b1494b2c'
	user node.user.username
end

bash 'build_command_t' do
	action :nothing
	cwd "#{command_t_dir}/ruby/command-t"
	code '/usr/bin/ruby1.8 extconf.rb && make'
end
