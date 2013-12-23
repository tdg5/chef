bash 'move_usb_bluetooth_script' do
  code 'mv /usr/lib/pm-utils/power.d/usb_bluetooth /usr/lib/pm-utils/power.d/usb_bluetooth.disabled'
  only_if 'file -e /usr/lib/pm-utils/power.d/usb_bluetooth'
end
