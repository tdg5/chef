name 'blackrock'
description 'Role for blackrock specifics'
run_list [
  'role[dev]',
  'role[postgres]',
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
  'tmux' => {
    'user_conf_group' => group,
    'user_conf_path' => "/home/#{user}/.tmux.conf",
    'user_conf_user' => user,
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
