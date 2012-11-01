apt_repository 'spotify' do
	components ['stable', 'non-free']
	key '94558F59'
	keyserver 'keyserver.ubuntu.com'
	uri 'http://repository.spotify.com'
end
package 'spotify-client'
