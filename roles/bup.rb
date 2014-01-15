name 'bup'
description 'Role for bup specifics'
run_list [
  'recipe[lib]',
  'role[base]',
  'role[rvm]',
  'role[vm_host]',
  'recipe[postgresql::server]',
  'recipe[qt::dev]',
  'role[design]',
  'role[dev]',
  'role[java]',
  'recipe[bup_wrapper]',
  'recipe[hipchat]',
  'role[nodejs]',
  'recipe[lastpass]',
]
user = group = 'danny'
global_gems = [{
  :name => 'gem-ctags',
}, {
  :name => 'chef',
  :version => '11.8.2',
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
  :postgresql => {
    :config => {
      :listen_addresses => 'localhost',
    },
    :super_user => {
      :password => 'postgres',
      :username => 'postgres',
    },
  },
  'rvm' => {
    'branch' => 'none',
    'default_ruby' => '2.1.0',
    'gems' => {
      '1.9.3-p385-falcon' => global_gems,
      '2.0.0-p353' => global_gems,
      '2.1.0' => global_gems,
    },
    'rubies' => [
      {
        'version' => '1.9.3-p385',
        'patch' => 'falcon',
      },
      '1.9.3-p484',
      '2.0.0-p353',
      '2.1.0',
    ],
    'rvmrc' => {
      'rvm_trust_rvmrcs_flag' => 1,
    },
    'version' => '1.25.14',
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
