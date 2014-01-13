git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/ctrlp" do
  group node.user.group
  repository 'https://github.com/kien/ctrlp.vim.git'
  revision 'b5d3fe66a58a13d2ff8b6391f4387608496a030f'
  user node.user.username
end
