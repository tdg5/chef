name 'vm_host'
description 'Role for VirtualBox based vm host'
run_list [
  'recipe[virtualbox]',
  'recipe[vagrant]',
]
default_attributes({
  'vagrant' => {
    'url' => 'https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_x86_64.deb',
    'checksum' => 'f614a60b258a856322f23d33a24201d26ab2555d047814fec403e834eb7d62b4',
  },
})
