name 'the_machine'
description 'Role for the machine'
run_list [
  'role[rvm]',
  'role[vm_host]',
  'role[docker]',
]
user = group = 'patrick'

default_attributes({
  :openssh => {
    :server => {
      :password_authentication => 'no',
    },
  },
  :rvm => {
    :branch => 'none',
    :rvmrc => {
      :rvm_trust_rvmrcs_flag => 1,
      :rvmsudo_secure_path => 1,
    },
    :version => '1.26.1',
    :default_ruby => '2.1.4',
    :gems => {
      '2.1.4' => [],
    },
    :global_gems => [{
      :name => 'gem-ctags',
    }],
    :rubies => [
      '2.1.4',
    ],
  },
  'user' => {
    'username' => user,
    'email' => 'obiedman@gmail.com',
    'group' => group,
  },
})
