cookbook_file "/home/#{node.user.username}/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml" do
  group node.user.group
  owner node.user.username
  mode 0600
end
