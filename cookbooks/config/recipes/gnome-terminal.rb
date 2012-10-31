cookbook_file "/home/#{node.user}/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml" do
	group node.group
	owner node.user
	mode 0600
end
