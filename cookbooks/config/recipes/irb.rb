cookbook_file "/home/#{node.user.username}/.irbrc" do
	group node.user.group
	owner node.user.username
	mode 0644
end
