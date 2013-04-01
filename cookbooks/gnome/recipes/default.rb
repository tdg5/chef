package 'gnome-shell'

components = %w[
	config::gnome-terminal
	gnome::extensions
	gnome::keybindings
	gnome::disable_overlay_scrollbars
	gnome::gsettings
]
components.each { |recipe| include_recipe recipe }

%w[gnome-tweak-tool].each do |pkg|
	package pkg
end
