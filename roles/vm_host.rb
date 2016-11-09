name 'vm_host'
description 'Role for VirtualBox based vm host'
run_list [
  'recipe[virtualbox]',
  'recipe[vagrant]',
]
default_attributes({
  'vagrant' => {
    'url' => 'https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb',
    'checksum' => 'ed0e1ae0f35aecd47e0b3dfb486a230984a08ceda3b371486add4d42714a693d',
  },
})
