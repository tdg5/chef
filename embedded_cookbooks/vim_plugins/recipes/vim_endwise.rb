git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/vim_endwise" do
  group node['user']['group']
  repository "https://github.com/tpope/vim-endwise.git"
  revision "0067ceda37725d01b7bd5bf249d63b1b5d4e2ab4"
  user node['user']['username']
end
