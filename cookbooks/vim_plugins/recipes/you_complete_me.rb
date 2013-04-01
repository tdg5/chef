you_complete_me_dir = "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/you_complete_me"
git you_complete_me_dir do
	group node.user.group
	notifies :run, 'bash[build_you_complete_me]'
	repository 'https://github.com/Valloric/YouCompleteMe.git'
	revision 'ba6b40e48545955b4143d42b82f2487df05edd22'
	user node.user.username
end

%w[build-essential cmake].each {|pkg| package pkg}

bash 'build_you_complete_me' do
	action :nothing
	code './install.sh'
	cwd you_complete_me_dir
end
