gsettings_code = ''
node.gnome.gsettings.each do |gsetting|
  current_setting_value = `sudo -u #{node.user.username} -- gsettings get #{gsetting[:schema]} #{gsetting[:key]} 2>/dev/null`.strip
  next if current_setting_value == gsetting[:value]
  gsettings_code += %Q[gsettings set #{gsetting[:schema]} #{gsetting[:key]} "#{gsetting[:value]}"\n]
end

bash 'set_gsettings_values' do
  code gsettings_code
  not_if { gsettings_code.empty? }
  user node.user.username
end
