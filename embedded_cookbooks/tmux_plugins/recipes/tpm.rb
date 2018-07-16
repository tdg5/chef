%W[
  /home/#{node['user']['username']}/#{node['tmux_plugins']['user_tmux_dir']}
  /home/#{node['user']['username']}/#{node['tmux_plugins']['user_plugin_dir']}
].each do |dir|
  directory dir do
    group node['user']['group']
    mode '0755'
    owner node['user']['username']
    recursive true
  end
end

git "/home/#{node['user']['username']}/#{node['tmux_plugins']['user_plugin_dir']}/tpm" do
  group node['user']['group']
  repository 'https://github.com/tmux-plugins/tpm'
  revision '6a84b0ed7b16fd27b88ec6ba9aff5b91f4009ea2'
  user node['user']['username']
end
