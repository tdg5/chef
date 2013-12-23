name 'surface'
description 'Role for surface specifics'
run_list [
  'recipe[modules::surface]',
  'role[base]',
  'role[tools]',
  'role[design]',
  'role[dev]',
  'role[rvm]',
  'recipe[java]',
  'role[nodejs]',
  'recipe[lastpass]',
]
user = group = 'tdg5'
default_attributes({
  :modprobe => {
    :blacklists => [
    ],
  },
  :rvm => {
    :branch => 'none',
    :rvmrc => {
      :rvm_trust_rvmrcs_flag => 1,
    },
    :version => '1.25.5',
    :default_ruby => '1.9.3-p484',
    :gems => {},
    :global_gems => [{
      :name => 'gem-ctags',
    }, {
      :name => 'chef',
      :version => '11.8.2',
    }, {
      :name => 'bundler'
    },],
    'rubies' => [
      '1.9.3-p484',
      '2.0.0-p353',
    ],
  },
  'user' => {
    'username' => user,
    'email' => 'dannyguinther@gmail.com',
    'group' => group,
  }
})
