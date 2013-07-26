git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/git_gutter" do
	group node.user.group
	repository 'git://github.com/airblade/vim-gitgutter.git'
	revision 'ff031d022f2123353bc93a3aa97290287c10a287'
	user node.user.username
end
