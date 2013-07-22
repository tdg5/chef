host_name = `hostname`.chomp
hostsfile_entry '127.0.0.1' do
	action :append
	hostname "#{host_name}.backupify.org"
end

%w[libreadline-dev python-software-properties].each do |pkg|
	package pkg
end
