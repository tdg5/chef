%W[
  /home/#{node.user.username}/#{node.vim_plugins.user_autoload_dir}
  /home/#{node.user.username}/#{node.vim_plugins.user_bundle_dir}
].each do |dir|
  directory dir do
    group node.user.group
    mode '0755'
    owner node.user.username
    recursive true
  end
end

include_recipe 'vim_plugins::pathogen'
include_recipe 'vim_plugins::matchit'
include_recipe 'vim_plugins::vim_ruby'
include_recipe 'vim_plugins::vim_rake'
include_recipe 'vim_plugins::vim_bundler'
include_recipe 'vim_plugins::vim_rails'
include_recipe 'vim_plugins::nerdcommenter'
include_recipe 'vim_plugins::syntastic'
include_recipe 'vim_plugins::ctrlp'
include_recipe 'vim_plugins::vim_fugitive'
include_recipe 'vim_plugins::vim_repeat'
include_recipe 'vim_plugins::vim_surround'
include_recipe 'vim_plugins::easymotion'
include_recipe 'vim_plugins::tagbar'
include_recipe 'vim_plugins::git_gutter'
include_recipe 'vim_plugins::vim_numbers'
include_recipe 'vim_plugins::vim_json'
include_recipe 'vim_plugins::mlessnau_block_shift'
include_recipe 'vim_plugins::colorschemes'
include_recipe 'vim_plugins::vim_trailing_whitespace'
include_recipe 'vim_plugins::vim_obsession'
include_recipe 'vim_plugins::markdown'
