apt_repository 'canonical_partners' do
	components ['partner']
	distribution node.lsb.codename
	keyserver 'keyserver.ubuntu.com'
	uri 'http://archive.canonical.com/'
	not_if "apt-cache policy | grep -q '#{node.lsb.codename}/partner'"
end
