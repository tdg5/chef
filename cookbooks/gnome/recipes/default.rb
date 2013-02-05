components = %w[
	config::gnome-terminal
	gnome::extensions
]
components.push('vim-gnome') if node.recipe?('vim')

components.each { |recipe| include_recipe recipe }

%w[gnome-tweak-tool].each do |pkg|
	package pkg
end
