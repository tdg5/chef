include_recipe 'scripts::web'

cookbook_file '/usr/local/bin/gem_github' do
  group 'root'
  mode 0755
  owner 'root'
end
