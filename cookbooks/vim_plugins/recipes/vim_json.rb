git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/json" do
	group node.user.group
	repository 'https://github.com/elzr/vim-json.git'
	revision '752e607ba78550de6ddace4f009ced4c5f7ae395'
	user node.user.username
end
