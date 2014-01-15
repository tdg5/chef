init_script_path = '/etc/init.d/powertune'
rsyslog_conf_path = '/etc/rsyslog.d'

cookbook_file init_script_path do
  group 'root'
  mode 0755
  owner 'root'
end

cookbook_file "#{rsyslog_conf_path}/20-powertune.conf" do
  group 'root'
  mode 0644
  owner 'root'
  notifies :run, 'bash[restart_rsyslog]'
  source 'rsyslog-powertune.conf'
end

bash 'restart_rsyslog' do
  action :nothing
  code 'service rsyslog restart'
  user 'root'
end

service 'powertune' do
  action [:enable, :start]
end
