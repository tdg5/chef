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
include_recipe 'vim_plugins::vim_rails'
include_recipe 'vim_plugins::nerdcommenter'
include_recipe 'vim_plugins::syntastic'
include_recipe 'vim_plugins::command_t'
include_recipe 'vim_plugins::vim_fugitive'
include_recipe 'vim_plugins::vim_repeat'
include_recipe 'vim_plugins::vim_surround'
include_recipe 'vim_plugins::easymotion'
include_recipe 'vim_plugins::tagbar'
include_recipe 'vim_plugins::powerline'
include_recipe 'vim_plugins::you_complete_me'
