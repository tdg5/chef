git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim_fugitive" do
  group node.user.group
  repository 'https://github.com/tpope/vim-fugitive.git'
  revision 'f6d93b8788b57990a2669b2408004c0086d6a878'
  user node.user.username
end
