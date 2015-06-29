name 'surface'
description 'Role for surface specifics'
run_list [
  'role[dev]',
  'recipe[modules]',
  'recipe[pm-utils::disable_usb_bluetooth]',
  'recipe[acpi_wakeup]',
  'role[design]',
  'recipe[lastpass]',
  'recipe[powertop::powertune]',
  'recipe[hipchat]',
  'recipe[ddclient]',
  'role[docker]',
  'role[vm_host]',
  'recipe[heroku_toolbelt]',
  'role[php]',
  'role[golang]',
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
  :gnome => {
    :settings => {
      :desktop_scale_factor => {
        :key => 'scaling-factor',
        :schema => 'org.gnome.desktop.interface',
        :user => user,
        :value => 1
      },
    },
  },
  :modprobe => {
    :blacklists => [],
  },
  :modules => {
    :modules => [
      'coretemp'
    ],
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
  :rvm => {
    :branch => 'none',
    :rvmrc => {
      :rvm_trust_rvmrcs_flag => 1,
      :rvmsudo_secure_path => 1,
    },
    :version => '1.26.6',
    :default_ruby => '2.2.0',
    :gems => {
      '2.2.0' => default_gems,
    },
    :global_gems => [{
      :name => 'gem-ctags',
    }],
    :rubies => [
      '2.1.4',
      '2.2.0',
    ],
  },
  :user => {
    :username => user,
    :email => 'dannyguinther@gmail.com',
    :group => group,
  }
})
override_attributes({
  :postgresql => {
    :pg_hba => [{
      :db => 'all',
      :method => 'trust',
      :type => 'local',
      :user => 'postgres',
    }, {
      :addr => '127.0.0.1/32',
      :db => 'all',
      :method => 'trust',
      :type => 'host',
      :user => 'postgres',
    }],
  },
})
