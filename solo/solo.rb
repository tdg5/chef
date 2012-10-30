dir = File.expand_path(File.dirname(__FILE__))
cookbook_path "#{dir}/../cookbooks"
file_cache_path '/tmp/chef/solo'
log_location '/var/log/tdg5_chef/chef-solo.log'
node_path "#{dir}/nodes"
role_path "#{dir}/../roles"
log_level :debug
verbose_logging true
