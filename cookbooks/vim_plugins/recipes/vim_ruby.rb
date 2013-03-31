git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim_ruby" do
	group node.user.group
	repository 'https://github.com/vim-ruby/vim-ruby.git'
	revision '5943faa4438b102ef19011f70599b6bc4f8a72c6'
	user node.user.username
end
