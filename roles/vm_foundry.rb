name 'vm_foundry'
description 'Role for hosts that generate vms'
run_list [
  'role[vm_host]',
  'recipe[packer]',
]
default_attributes({
  'packer' => {
    'version' => '0.9.0',
  },
})
