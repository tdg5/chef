cookbook_file "/home/#{node.user}/.bashrc" do
	group node.group
	owner node.user
	mode 0644
end
