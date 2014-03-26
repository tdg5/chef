include_recipe 'ubuntuone'

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

ubuntuone_fonts = "#{user_fonts_dir}/ubuntuone_fonts"
link ubuntuone_fonts do
  group node.user.group
  owner node.user.username
  notifies :run, 'bash[update_font_cache]'
  to "#{home_dir}/Ubuntu One/fonts"
end

bash 'update_font_cache' do
  action :nothing
  code 'fc-cache -vf'
  user 'root'
end
