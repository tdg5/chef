git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/vim-niji" do
  group node['user']['group']
  repository "https://github.com/vim-scripts/vim-niji.git"
  revision "f3f10d4219792b0e93fa6439c183b13a98922e71"
  user node['user']['username']
end
