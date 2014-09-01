template "/home/#{node.user.username}/.tmux.conf" do
  group node.user.group
  owner node.user.username
  mode 0644
end
