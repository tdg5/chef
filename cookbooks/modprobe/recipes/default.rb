template "/etc/modprobe.d/blacklist-#{node.hostname}.conf" do
	group 'root'
	mode '0644'
	notifies :run, 'bash[update-initramfs]'
	source 'blacklist.erb'
	user 'root'
end

bash 'update-initramfs' do
	action :nothing
	code 'update-initramfs -k all -u'
	group 'root'
	user 'root'
end
