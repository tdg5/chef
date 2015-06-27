if GnomeVersion.gnome_version_constraint('~> 3.2.0')
  include_recipe('gnome::extensions_3.2')
elsif GnomeVersion.gnome_version_constraint('~> 3.9.0')
  include_recipe('gnome::extensions_3.9')
end
