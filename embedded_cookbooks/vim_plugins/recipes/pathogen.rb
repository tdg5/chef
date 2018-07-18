git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/vim-pathogen" do
  group node['user']['group']
  repository 'https://github.com/tpope/vim-pathogen.git'
  revision 'f1926ab6731cb1877160ff94d01ea644d257076e'
  user node['user']['username']
end
