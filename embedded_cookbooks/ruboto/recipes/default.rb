rvm_gem 'ruboto' do
  ruby_string node[:rvm][:default_ruby]
end

cookbook_file "/home/#{node[:user][:username]}/.rubotorc" do
  group node[:user][:group]
  mode 0755
  owner node[:user][:username]
end
