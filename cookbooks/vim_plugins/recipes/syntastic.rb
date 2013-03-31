git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/syntastic" do
	group node.user.group
	repository 'https://github.com/scrooloose/syntastic.git'
	revision '78f345bab3865159596ffeeaaffd580e82716edd'
	user node.user.username
end
