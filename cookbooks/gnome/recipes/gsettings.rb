gsettings_code = %q{gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'pidgin.desktop', 'spotify.desktop', 'rhythmbox.desktop', 'nautilus.desktop', 'gnome-terminal.desktop', 'gimp.desktop']"}

bash 'set_gsettings_values' do
	code gsettings_code
	user node.user.username
end
