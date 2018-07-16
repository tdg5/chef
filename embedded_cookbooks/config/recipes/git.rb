template "/home/#{node['user']['username']}/.gitconfig" do
  group node['user']['group']
  mode 0644
  owner node['user']['username']
end

cookbook_file "/home/#{node['user']['username']}/.gitignore" do
  group node['user']['group']
  mode 0644
  owner node['user']['username']
end
