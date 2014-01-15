script_path = '/etc/init.d/acpi_wakeup'

template script_path do
  group 'root'
  mode '0755'
  owner 'root'
end

service 'acpi_wakeup' do
  action [:enable, :start]
  supports :status => true, :restart => true
end
