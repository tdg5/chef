name 'bup'
description 'Role for bup specifics'
run_list [
  'role[dev]',
  'role[vm_host]',
  'recipe[qt::dev]',
  'role[design]',
  'role[dev]',
  'recipe[bup_wrapper]',
  'recipe[hipchat]',
  'recipe[lastpass]',
]
user = group = 'danny'
global_gems = [{
  :name => 'gem-ctags',
}, {
  :name => 'chef',
  :version => '11.10.4',
}, {
  :name => 'bundler'
}]
default_attributes({
  :bash => {
    :bashrc => {
      :extra_sources => [
        '~/scripts/ec2env',
      ],
    },
  },
  :openssh => {
    :server => {
      :password_authentication => 'no',
    },
  },
  :postgresql => {
    :config => {
      :listen_addresses => 'localhost',
    },
    :super_user => {
      :password => 'postgres',
      :username => 'postgres',
    },
    :revision => '4',
    :version => '9.3',
  },
  'rvm' => {
    'branch' => 'none',
    'default_ruby' => '2.1.1',
    'gems' => {
      '1.9.3-p385-falcon' => global_gems,
      '2.1.1' => global_gems,
    },
    'rubies' => [
      {
        'version' => '1.9.3-p385',
        'patch' => 'falcon',
      },
      '2.1.1',
    ],
    'rvmrc' => {
      'rvm_trust_rvmrcs_flag' => 1,
      :rvmsudo_secure_path => 1,
    },
    'version' => '1.25.22',
  },
  'user' => {
    'username' => user,
    'email' => 'danny@backupify.com',
    'group' => group,
  }
})

override_attributes({
  :postgresql => {
    :pg_hba => [
      {
        :addr => '127.0.0.1/32',
        :db => 'all',
        :method => 'trust',
        :type => 'host',
        :user => 'postgres',
      },
      {
        :db => 'all',
        :method => 'trust',
        :type => 'local',
        :user => 'postgres',
      },
    ],
  },
})
