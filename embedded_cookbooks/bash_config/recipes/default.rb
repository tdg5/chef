file "/home/#{node['user']['username']}/.bash_profile" do
  action :delete
  only_if "file -e /home/#{node['user']['username']}/.bash_profile"
end

template "/home/#{node['user']['username']}/.bashrc" do
  group node['user']['group']
  owner node['user']['username']
  mode 0644
end

cookbook_file "/home/#{node['user']['username']}/.bash_aliases" do
  group node['user']['group']
  owner node['user']['username']
  mode 0644
end

node['bash']['completion'].each do |completion|
  cookbook_file "/etc/bash_completion.d/#{completion}" do
    group 'root'
    mode 0644
    owner 'root'
    source "completion/#{completion}"
  end
end
