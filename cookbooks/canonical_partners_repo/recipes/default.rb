apt_repository 'canonical_partners' do
	components ['partner']
	distribution node.lsb.codename
	keyserver 'keyserver.ubuntu.com'
	uri 'http://archive.canonical.com/'
end
