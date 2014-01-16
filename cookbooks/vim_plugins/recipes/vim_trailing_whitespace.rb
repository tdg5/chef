git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim-trailing-whitespace" do
  group node.user.group
  repository 'https://github.com/bronson/vim-trailing-whitespace.git'
  revision '423477008495c8c1699abe1c9fbf4b34e86e2f79'
  user node.user.username
end
