cookbook_file '/etc/default/grub' do
  action :create
  group 'root'
  mode '0644'
  notifies :run, 'bash[update-grub]'
  owner 'root'
  source 'blackrock_grub'
end

bash 'update-grub' do
  action :nothing
  code 'update-grub'
  user 'root'
end

