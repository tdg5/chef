package 'gnome-shell'

components = %w[
  gnome::gnome_terminal_config
  gnome::extensions
  gnome::disable_overlay_scrollbars
  gnome::settings
  gnome::wallpapers
]
components.push('vim-gnome') if node.recipe?('vim')
if GnomeVersion.gnome_version_constraint('= 3.9.90')
  components.push('gnome::shell_hacks')
end

components.each { |recipe| include_recipe recipe }

%w[gnome-tweak-tool].each do |pkg|
  package pkg
end
