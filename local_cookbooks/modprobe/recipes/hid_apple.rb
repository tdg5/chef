include_recipe 'modprobe::update_initramfs'

cookbook_file '/etc/modprobe.d/hid_apple.conf' do
  group 'root'
  mode 0644
  notifies :run, 'bash[update-initramfs]'
  owner 'root'
end
