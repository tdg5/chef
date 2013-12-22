%w[overlay-scrollbar liboverlay-scrollbar-0.2-0 liboverlay-scrollbar3-0.2-0].each do |pkg|
 package pkg do
  action :remove
  only_if "dpkg -s #{pkg} >/dev/null 2>&1"
 end
end
