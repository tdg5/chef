git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim_fireplace" do
  group node.user.group
  repository 'https://github.com/tpope/vim-fireplace.git'
  revision '46af4344ee29c0e898c8142d395b472ee341de00'
  user node.user.username
end
