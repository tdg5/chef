apt_repository 'spotify' do
	components ['main', 'precise']
	key '5044912E'
	keyserver 'pgp.mit.edu'
	uri 'http://linux.dropbox.com/ubuntu'
end
package 'nautilus-dropbox'
