git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim_repeat" do
  group node.user.group
  repository 'https://github.com/tpope/vim-repeat.git'
  revision 'a81bef76031ca1c71766b516417480caeb01c932'
  user node.user.username
end
