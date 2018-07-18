git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/vim-testkey" do
  group node['user']['group']
  repository 'https://github.com/botandrose/vim-testkey.git'
  revision 'dcbd3dd81d9bafbfed960df166db48ce7fdfb324'
  user node['user']['username']
end
