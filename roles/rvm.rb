name 'rvm'
description 'Role for nodes with RVM/Ruby'
run_list [
  'recipe[rvm::system]',
  'recipe[config::irb]',
]
default_attributes({
  'bash' => {
    'bashrc' => {
      'extra_sources' => {
        'RVM' => '/etc/profile.d/rvm.sh',
      },
    },
  },
})
