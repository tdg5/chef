cookbook_file "/home/#{node.user}/.vimrc" do
	group node.group
	owner node.user
	mode 0644
end
