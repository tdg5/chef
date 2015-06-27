git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/syntastic" do
  group node.user.group
  repository 'https://github.com/scrooloose/syntastic.git'
  revision 'c035ac24269b999a4caebb5bb7b318ee96614129'
  user node.user.username
end
