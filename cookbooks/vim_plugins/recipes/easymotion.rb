git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/easymotion" do
	group node.user.group
	repository 'https://github.com/Lokaltog/vim-easymotion.git'
	revision '667a668e114e9ec0e5d4cbcb0962d835b23614c4'
	user node.user.username
end
