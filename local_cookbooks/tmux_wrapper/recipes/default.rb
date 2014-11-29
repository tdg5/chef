include_recipe 'tmux::_source'

link '/usr/bin/tmux' do
  group 'root'
  to '/opt/tmux/bin/tmux'
  user 'root'
end

include_recipe 'tmux_wrapper::config'
