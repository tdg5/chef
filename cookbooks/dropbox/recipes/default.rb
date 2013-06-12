apt_repository 'dropbox' do
	components ['main']
	distribution node.lsb.codename
	key '5044912E'
	keyserver 'pgp.mit.edu'
	uri 'http://linux.dropbox.com/ubuntu'
end
package 'nautilus-dropbox'
