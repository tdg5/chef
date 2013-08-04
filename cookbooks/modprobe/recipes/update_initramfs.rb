bash 'update-initramfs' do
	action :nothing
	code 'update-initramfs -k all -u'
	group 'root'
	user 'root'
end
