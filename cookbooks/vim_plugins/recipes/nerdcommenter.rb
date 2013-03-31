git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/nerdcommenter" do
	group node.user.group
	repository 'https://github.com/scrooloose/nerdcommenter.git'
	revision '0b3d928dce8262dedfc2f83b9aeb59a94e4f0ae4'
	user node.user.username
end
