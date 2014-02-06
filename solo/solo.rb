root_dir = File.expand_path('../..', __FILE__)
home_dir = `echo $HOME`.strip

cookbook_path "#{root_dir}/cookbooks"
data_bag_path "#{root_dir}/data_bags"
encrypted_data_bag_secret "#{home_dir}/.ssh/id_rsa.home"
file_cache_path '/tmp/chef/solo'
log_location "#{root_dir}/log/chef-solo.log"
node_path "#{root_dir}/solo/nodes"
role_path "#{root_dir}/roles"
log_level :debug
verbose_logging true
