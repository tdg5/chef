cookbook_file "/home/#{node['user']['username']}/.local/share/applications/mimeapps.list" do
  group node['user']['group']
  owner node['user']['username']
  mode 0664
end
