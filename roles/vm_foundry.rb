name 'vm_foundry'
description 'Role for hosts that generate vms'
run_list [
  'role[vm_host]',
  'recipe[chef-packer]',
]
default_attributes({
  'packer' => {
    'version' => '1.2.5',
  },
})
