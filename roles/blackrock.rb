name 'blackrock'
description 'Role for blackrock specifics'
run_list [
  'role[dev]',
  'recipe[grub::blackrock]',
  'recipe[filesystem_layout::blackrock]',
  'recipe[vgaswitcheroo]',
  'recipe[modprobe]',
  'recipe[modprobe::hid_apple]',
  'role[video]',
  'role[design]',
  'role[vm_host]',
  'recipe[audacity]',
  #'recipe[modprobe::blackrock_alsa]',
  'recipe[lastpass]',
  'recipe[hipchat]',
  'recipe[ddclient]',
  'role[docker]',
  'recipe[heroku_toolbelt]',
]
user = group = 'tdg5'
ddclient_config = Chef::EncryptedDataBagItem.load('ddclient', 'tdg5')
default_gems = [{
  :name => 'chef',
  :version => '11.10.4',
}, {
  :name => 'bundler'
}]
default_attributes({
  :ddclient => {
    :login => ddclient_config['login'],
    :password => ddclient_config['password'],
    :protocol => 'namecheap',
    :records => 'blackrock',
    :server => 'dynamicdns.park-your-domain.com',
    :use => 'web, web=checkip.dyndns.org/, web-skip=\'IP Address\'',
  },
  :modprobe => {
    :blacklists => [
    ],
  },
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
    :version => '1.25.31',
    :default_ruby => '2.1.3',
    :gems => {
      '2.1.3' => default_gems,
    },
    :global_gems => [{
      :name => 'gem-ctags',
    }],
    :rubies => [
      '2.1.3',
    ],
  },
  'postgresql' => {
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
  'user' => {
    'username' => user,
    'email' => 'dannyguinther@gmail.com',
    'group' => group,
  },
})

override_attributes({
  :postgresql => {
    :pg_hba => [
      {
        :db => 'all',
        :method => 'trust',
        :type => 'local',
        :user => 'postgres',
      },
    ],
  },
})
