apt_repository 'google-chrome' do
	components ['stable', 'main']
	key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
	uri 'http://dl.google.com/linux/chrome/deb/'
end

package 'google-chrome-stable'
