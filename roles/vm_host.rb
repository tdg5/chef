name 'vm_host'
description 'Role for VirtualBox based vm host'
run_list [
  'recipe[virtualbox]',
  'recipe[vagrant]',
]
default_attributes({
  'vagrant' => {
    'url' => 'http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/vagrant_1.3.5_x86_64.deb',
    'checksum' => 'db7d06f46e801523d97b6e344ea0e4fe942f630cc20ab1706e4c996872f8cd71',
  },
})
