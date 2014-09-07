package 'fontmatrix'
package 'msttcorefonts'
package 'fonts-mgopen'

home_dir = "/home/#{node.user.username}"
user_fonts_dir = "#{home_dir}/.fonts"

directory user_fonts_dir do
  group node.user.group
  mode 0775
  owner node.user.username
end

cloud_fonts = "#{user_fonts_dir}/cloud_fonts"
link cloud_fonts do
  group node.user.group
  owner node.user.username
  notifies :run, 'bash[update_font_cache]'
  to "#{home_dir}/Dropbox/config/fonts"
end

bash 'update_font_cache' do
  action :nothing
  code 'fc-cache -vf'
  user 'root'
end
