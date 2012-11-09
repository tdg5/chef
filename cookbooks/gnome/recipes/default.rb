components = %w[
	config::gnome-terminal
	gnome::extension_alternative_status_menu
	gnome::extension_system_monitor
]
components.push('vim-gnome') if node.recipe?('vim')

components.each { |recipe| include_recipe recipe }

# gnome-tweak-tool
