git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/colorschemes" do
  group node['user']['group']
  repository 'https://github.com/flazz/vim-colorschemes.git'
  revision 'f134dd5726732a74e05edacc9a795006b984b82f'
  user node['user']['username']
end
