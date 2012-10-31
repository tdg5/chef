template "/home/#{node.user.username}/.gitconfig" do
	owner node.user.username
	group node.user.group
	mode 0644
end
