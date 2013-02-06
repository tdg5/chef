%w[overlay-scrollbar liboverlay-scrollbar-0.2-0 liboverlay-scrollbar3-0.2-0].each do |pkg|
	package pkg do
		action :remove
	end
end
