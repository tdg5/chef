git "/home/#{node['user']['username']}/#{node['vim_plugins']['user_bundle_dir']}/vim_numbers" do
  group node['user']['group']
  repository 'https://github.com/myusuf3/numbers.vim.git'
  revision 'a8ea0f771e9e9115bf851acec2df628be8557303'
  user node['user']['username']
end
