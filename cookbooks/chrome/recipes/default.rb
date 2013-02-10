# Chome will add its own repo after installation so method below is preferred,
# but untested. Delete this after testing dpkg install.
#apt_repository 'google-chrome' do
#	components ['stable', 'main']
#	key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
#	uri 'http://dl.google.com/linux/chrome/deb/'
#end
#
#package 'google-chrome-stable'

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
