git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/vim_surround" do
  group node['user']['group']
  repository 'https://github.com/tpope/vim-surround.git'
  revision '02199ea0080d744ec76b79d74ce56d51d25cf7ae'
  user node['user']['username']
end
