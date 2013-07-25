cookbook_file "/home/#{node.user.username}/.sshagentrc" do
	group node.user.group
	owner node.user.username
	mode 0744
end

file '/etc/X11/Xsession.d/90x11-common_ssh-agent' do
	action :delete
	only_if 'file -e /etc/X11/Xsession.d/90x11-common_ssh-agent'
end
