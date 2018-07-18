git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/vim_rake" do
  group node['user']['group']
  repository 'https://github.com/tpope/vim-rake.git'
  revision 'fd3e215fdd77d5d6528ccde5d778b5d90883c52b'
  user node['user']['username']
end
