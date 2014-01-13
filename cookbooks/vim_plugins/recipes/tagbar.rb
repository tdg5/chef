include_recipe 'exuberant-ctags'

git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/tagbar" do
  group node.user.group
  repository 'https://github.com/majutsushi/tagbar.git'
  revision 'dec1f840fb226f6d42b0d4200e8485e64fadaa2a'
  user node.user.username
end
