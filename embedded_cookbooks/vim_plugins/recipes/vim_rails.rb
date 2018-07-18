git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/vim_rails" do
  group node['user']['group']
  repository 'https://github.com/tpope/vim-rails.git'
  revision '6b6369ecfdc68b15389ef0c599aa6647337c4450'
  user node['user']['username']
end
