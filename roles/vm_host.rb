name 'vm_host'
description 'Role for VirtualBox based vm host'
run_list [
  'recipe[virtualbox]',
  'recipe[vagrant]',
  'recipe[packer]',
]
default_attributes({
  'vagrant' => {
    'url' => 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.deb',
    'checksum' => 'e2c7af6d032ac551ebd6399265cb9cb64402c9fb96a12289161b7f67afada28a',
  },
  'packer' => {
    'version' => '0.8.0',
  },
})
