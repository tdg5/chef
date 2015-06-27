installation_config = node['liquidprompt']['installation']
git installation_config['path'] do
  group installation_config['group']
  repository installation_config['repository']
  revision installation_config['revision']
  user installation_config['owner']
end

user_config_dir = "/home/#{node.user.username}/.config"

template File.join(user_config_dir, 'liquidpromptrc') do
  group node.user.group
  owner node.user.username
  mode 0755
end

template File.join(user_config_dir, 'liquidprompt.ps1') do
  group node.user.group
  owner node.user.username
  mode 0755
end
