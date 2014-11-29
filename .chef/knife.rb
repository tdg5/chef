root_dir = File.expand_path('../..', __FILE__)

cookbook_path(%W[
  #{root_dir}/cookbooks
  #{root_dir}/local_cookbooks
])

data_bag_path "#{root_dir}/data_bags"
encrypted_data_bag_secret File.join(ENV['HOME'] || '~', '.ssh', 'id_rsa')
file_cache_path "#{root_dir}/.cache"
log_location "#{root_dir}/log/chef-solo.log"
node_path "#{root_dir}/nodes"
role_path "#{root_dir}/roles"
log_level :debug
verbose_logging true

knife[:berkshelf_path] = 'cookbooks'
knife[:provisioning_path] = '~/.chef-solo'
