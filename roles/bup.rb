name 'bup'
description 'Role for bup specifics'
run_list [
  'role[dev]',
  'role[vm_host]',
  'recipe[qt::dev]',
  'role[design]',
  'role[dev]',
  'role[docker]',
  'recipe[bup_wrapper]',
  'recipe[hipchat]',
  'recipe[lastpass]',
  'role[golang]',
]
user = group = 'danny'
default_gems = [{
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
      :extra_sources => {
        'Backupify-specific aliases' => '~/scripts/bup_aliases',
        'EC2 env switcher' => '~/scripts/ec2env',
      },
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
    :branch => 'none',
    :default_ruby => '2.1.2',
    :gems => {
      '2.1.1' => default_gems,
      '2.1.2' => default_gems,
    },
    :global_gems => [{
      :name => 'gem-ctags',
    }],
    :rubies => [
      '2.1.1',
      '2.1.2',
    ],
    :rvmrc => {
      :rvm_trust_rvmrcs_flag => 1,
      :rvmsudo_secure_path => 1,
    },
    :version => '1.25.28',
  },
  :user => {
    :username => user,
    :email => 'danny@backupify.com',
    :group => group,
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
