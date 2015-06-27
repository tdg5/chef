directory File.dirname(node.gnome.wallpapers.manifest_path) do
  mode '0755'
  recursive true
end

script_path = node.gnome.wallpapers.update_script_path
directory File.dirname(script_path) do
  mode '0755'
  recursive true
end

template script_path do
  mode '0755'
  source 'update_gnome_wallpapers_manifest.rb.erb'
end

bash 'update_gnome_wallpapers_manifest' do
  code script_path
end
