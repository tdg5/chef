git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim_obsession" do
  group node.user.group
  repository 'https://github.com/tpope/vim-obsession.git'
  revision '4ab72e07ec3e25f33066217ddaf9863c7b597cf5'
  user node.user.username
end
