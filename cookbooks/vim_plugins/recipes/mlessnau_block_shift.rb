plugin_directory = "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/mlessnau_block_shift/plugin"

directory plugin_directory do
  group node.user.group
  user node.user.username
  recursive true
end

cookbook_file "#{plugin_directory}/mlessnau_block_shift.vim" do
  group node.user.group
  user node.user.username
end
