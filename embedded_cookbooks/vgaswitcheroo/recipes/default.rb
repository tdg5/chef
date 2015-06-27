switcheroo_path = '/etc/init.d/vgaswitcheroo'
cookbook_file switcheroo_path do
  group 'root'
  mode '0755'
  owner 'root'
end

service 'vgaswitcheroo' do
  action [:enable, :start]
  supports :status => true, :restart => true
end
