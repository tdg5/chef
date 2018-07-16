package 'ssh-askpass'

cookbook_file "/home/#{node['user']['username']}/.sshagentrc" do
  group node['user']['group']
  owner node['user']['username']
  mode 0744
end

# Prevent various other services from starting ssh-agent
{
  'X11' => '/etc/X11/Xsession.d/90x11-common_ssh-agent',
  'gnome_keyring' => '/etc/xdg/autostart/gnome-keyring-ssh.desktop',
}.each_pair do |init_owner, init_file|
  bash "remove_#{init_owner}_ssh_agent_initializer" do
    code "mv #{init_file} #{init_file}.bak"
    only_if "test -e #{init_file}"
    user 'root'
  end
end

xsession_options_path = '/etc/X11/Xsession.options'
bash 'prevent_Xsession_from_starting_ssh_agent' do
  code "sed -i 's/^use-ssh-agent/# use-ssh-agent/' #{xsession_options_path}"
  only_if "grep '^use-ssh-agent' #{xsession_options_path}"
  user 'root'
end
