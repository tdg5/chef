include_recipe 'modprobe::update_initramfs'

template "/etc/modprobe.d/blacklist-#{node.hostname}.conf" do
  group 'root'
  mode '0644'
  notifies :run, 'bash[update-initramfs]'
  source 'blacklist.erb'
  user 'root'
end
