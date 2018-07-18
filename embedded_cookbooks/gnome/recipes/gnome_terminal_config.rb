config_path = "/home/#{node['user']['username']}/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml"
config_dir = File.dirname(config_path)

directory config_dir do
  group node['user']['group']
  owner node['user']['username']
  recursive true
end

cookbook_file config_path do
  group node['user']['group']
  owner node['user']['username']
  mode 0600
  source 'gnome_terminal_gconf.xml'
end
