include_recipe 'ubuntuone'

package 'fontmatrix msttcorefonts fonts-mgopen ttf-mgopen'

home_dir = "/home/#{node.user.username}"
user_fonts_dir = "#{home_dir}/.fonts"

directory user_fonts_dir do
	group node.user.group
	owner node.user.username
	mode 0775
end

link "#{user_fonts_dir}/ubuntuone_fonts" do
	group node.user.group
	notifies :run, 'bash[update_font_cache]'
	owner node.user.username
	to "#{home_dir}/Ubuntu One/fonts"
end

bash 'update_font_cache' do
	action :nothing
	code 'fc-cache -vf'
	user 'root'
end
