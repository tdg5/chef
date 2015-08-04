git "/home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}/vim_go" do
  group node.user.group
  repository 'https://github.com/fatih/vim-go.git'
  revision 'b5b6855a43e389eccefec1b52aa3f7f2a04bdeb2'
  user node.user.username
end
