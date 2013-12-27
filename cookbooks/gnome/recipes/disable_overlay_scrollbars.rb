# Later version of gnome bitch a lot if overlay scrollbars is missing
%w[overlay-scrollbar liboverlay-scrollbar-0.2-0 liboverlay-scrollbar3-0.2-0].each do |pkg|
 package pkg do
  action :remove
  only_if { GnomeVersion.gnome_version_constraint('< 3.4') }
 end
end
