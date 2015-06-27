rvm_gem 'tmuxinator' do
  ruby_string node[:rvm][:default_ruby]
end

cookbook_file '/etc/bash_completion.d/tmuxinator' do
  group 'root'
  mode 0644
  owner 'root'
  source 'tmuxinator.bash'
end
