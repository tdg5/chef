name 'surface'
description 'Role for surface specifics'
run_list [
  'recipe[ddclient]',
  'recipe[lib]',
  'recipe[modules::surface]',
  'recipe[pm-utils::disable_usb_bluetooth]',
  'recipe[acpi_wakeup]',
  'role[base]',
  'role[tools]',
  'role[design]',
  'role[dev]',
  'role[rvm]',
  'role[java]',
  'role[nodejs]',
  'recipe[postgresql::server]',
  'recipe[lastpass]',
  'recipe[powertop::powertune]',
]
user = group = 'tdg5'
ddclient_config = Chef::EncryptedDataBagItem.load('ddclient', 'tdg5')
default_attributes({
  :acpi_wakeup => {
    :devices => %w[EHC1 EHC2 XHC],
  },
  :ddclient => {
    :login => ddclient_config['login'],
    :password => ddclient_config['password'],
    :protocol => 'namecheap',
    :records => 'surface',
    :server => 'dynamicdns.park-your-domain.com',
    :use => 'web, web=checkip.dyndns.org/, web-skip=\'IP Address\'',
  },
  :modprobe => {
    :blacklists => [
    ],
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
  :rvm => {
    :branch => 'none',
    :rvmrc => {
      :rvm_trust_rvmrcs_flag => 1,
      :rvmsudo_secure_path => 1,
    },
    :version => '1.25.15',
    :default_ruby => '2.1.0',
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
      '2.1.0',
    ],
  },
  'user' => {
    'username' => user,
    'email' => 'dannyguinther@gmail.com',
    'group' => group,
  }
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
      {
        :addr => '127.0.0.1/32',
        :db => 'all',
        :method => 'trust',
        :type => 'host',
        :user => 'postgres',
      },
    ],
  },
})
