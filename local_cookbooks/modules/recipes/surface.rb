cookbook_file '/etc/modules' do
  group 'root'
  mode '0644'
  owner 'root'
  source 'modules.surface'
end
