switcheroo_path = '/etc/init.d/vgaswitcheroo'
cookbook_file switcheroo_path do
  group 'root'
  mode '0755'
  not_if "test -e #{switcheroo_path}"
  owner 'root'
end

service 'vgaswitcheroo' do
  action [:enable, :start]
  supports :status => true, :restart => true
end
