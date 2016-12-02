git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim_autoclose" do
  group node.user.group
  repository "https://github.com/Townk/vim-autoclose.git"
  revision "a9a3b7384657bc1f60a963fd6c08c63fc48d61c3"
  user node.user.username
end
