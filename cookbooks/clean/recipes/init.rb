#
# Cookbook Name:: clean
# Recipe:: init
# Description:: Clean up after init
#

%w[
  ruby1.8
  ruby1.9.1
  rubygems
].each do |pkg|
  package pkg do
    action :remove
  end
end


commands = [
  'apt-get -y autoremove',
  'apt-get clean',
]

commands.each do |command|
  bash %[run command #{command}] do
    action :run
    code command
    user 'root'
  end
end
