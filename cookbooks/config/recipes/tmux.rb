cookbook_file "/home/#{node.user}/.tmux.conf" do
	group node.group
	owner node.user
	mode 0644
end
