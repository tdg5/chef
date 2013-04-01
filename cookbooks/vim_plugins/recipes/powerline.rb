git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/powerline" do
	group node.user.group
	repository 'https://github.com/Lokaltog/vim-powerline.git'
	revision '09c0cea859a2e0989eea740655b35976d951a84e'
	user node.user.username
end
