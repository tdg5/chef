cookbook_file '/etc/modprobe.d/alsa-base.conf' do
	group 'root'
	mode '0644'
	owner 'root'
end
