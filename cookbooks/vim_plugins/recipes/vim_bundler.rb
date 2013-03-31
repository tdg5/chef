git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim_bundler" do
	group node.user.group
	repository 'https://github.com/tpope/vim-bundler.git'
	revision '1c6f4716bedee690a5d0b283d4b6195b0da7d07d'
	user node.user.username
end
