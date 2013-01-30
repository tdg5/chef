components = %w[
	config::gnome-terminal
	gnome::extension_alternative_status_menu
	gnome::extension_system_monitor
	gnome::extension_remove_accessibility
]
components.push('vim-gnome') if node.recipe?('vim')

components.each { |recipe| include_recipe recipe }

%w[gnome-tweak-tool].each do |pkg|
	package pkg
end
