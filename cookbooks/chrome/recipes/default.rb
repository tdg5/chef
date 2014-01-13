remote_file '/tmp/google-chrome-stable_current_amd64.deb' do
  backup false
  notifies :install, 'dpkg_package[google-chrome]'
  source 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
  not_if 'which google-chrome'
end

dpkg_package 'google-chrome' do
  action :nothing
  source '/tmp/google-chrome-stable_current_amd64.deb'
end

cookbook_file '/usr/bin/new_chrome_with_focus' do
  group 'root'
  mode 0755
  owner 'root'
end
