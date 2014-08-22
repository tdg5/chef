name 'vm_host'
description 'Role for VirtualBox based vm host'
run_list [
  'recipe[virtualbox]',
  'recipe[vagrant]',
]
default_attributes({
  'vagrant' => {
    'url' => 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb',
    'checksum' => '0fc3259cf08b693e3383636256734513ee93bf258f8328efb64e1dde447aadbe',
  },
})
