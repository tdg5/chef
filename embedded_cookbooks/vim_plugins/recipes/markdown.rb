git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/markdown" do
  group node['user']['group']
  repository 'https://github.com/plasticboy/vim-markdown.git'
  revision 'f8bd8714e62678851f97c1ae88633d59d24118c2'
  user node['user']['username']
end
