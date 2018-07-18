link '/usr/local/bin/web' do
  group 'root'
  mode 0755
  owner 'root'
  to node['scripts']['web_bin']
end
