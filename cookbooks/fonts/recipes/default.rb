include_recipe 'ubuntuone'

package 'fontmatrix msttcorefonts'

home_dir = "/home/#{node.user.username}"
user_fonts_dir = "#{home_dir}/.fonts"

directory user_fonts_dir do
	group node.user.group
	owner node.user.username
	mode 0775
end

link "#{user_fonts_dir}/ubuntuone_fonts" do
	group node.user.group
	owner node.user.username
	to "#{home_dir}/Ubuntu One/fonts"
end
