%w[
  /usr/share/pulseaudio/alsa-mixer/paths/analog-output-headphones.conf
  /usr/share/pulseaudio/alsa-mixer/paths/analog-output-headphones-2.conf
].each do |conf|
  cookbook_file conf do
    group 'root'
    mode '0644'
    owner 'root'
  end
end
