cookbook_file '/etc/init.d/vgaswitcheroo' do
	group 'root'
	mode '0755'
	owner 'root'
end

bash 'update-rc' do
	code 'update-rc.d vgaswitcheroo start 20 1 2 3 4 5 . stop 20 0 1 6 .'
	user 'root'
end
