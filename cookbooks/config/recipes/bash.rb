file "/home/#{node.user.username}/.bash_profile" do
	action :delete
end

cookbook_file "/home/#{node.user.username}/.bashrc" do
	group node.user.group
	owner node.user.username
	mode 0644
end
