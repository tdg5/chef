name 'surface'
description 'Role for surface specifics'
run_list [
  'role[dev]',
  'role[postgres]',
  'recipe[modules]',
  'recipe[pm-utils::disable_usb_bluetooth]',
  'recipe[acpi_wakeup]',
  'role[design]',
  'recipe[powertop::powertune]',
  'recipe[ddclient]',
  'role[docker]',
  'role[vm_host]',
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
  'tmux' => {
    'user_conf_group' => group,
    'user_conf_path' => "/home/#{user}/.tmux.conf",
    'user_conf_user' => user,
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
