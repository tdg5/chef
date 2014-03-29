name 'blackrock'
description 'Role for blackrock specifics'
run_list [
  'recipe[lib]',
  'role[base]',
  'recipe[grub::blackrock]',
  'recipe[filesystem_layout::blackrock]',
  'recipe[vgaswitcheroo]',
  'recipe[modprobe]',
  'recipe[modprobe::hid_apple]',
  'role[tools]',
  'role[video]',
  'role[design]',
  'role[dev]',
  'role[rvm]',
  'role[vm_host]',
  'recipe[audacity]',
  'role[java]',
  'recipe[modprobe::blackrock_alsa]',
  'recipe[pulseaudio::blackrock_alsa_mixer]',
  'recipe[postgresql::server]',
  'role[nodejs]',
  'recipe[lastpass]',
  'recipe[hipchat]',
  'recipe[ddclient]',
]
user = group = 'tdg5'
ddclient_config = Chef::EncryptedDataBagItem.load('ddclient', 'tdg5')
default_gems = [{
  :name => 'chef',
  :version => '11.10.4',
}, {
  :name => 'bundler'
}, {
  :name => 'gem-ctags',
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
    :version => '1.25.22',
    :default_ruby => '2.1.1',
    :gems => {
      '2.0.0-p451' => default_gems,
      '2.1.1' => default_gems,
    },
    :rubies => [
      '1.9.3-p545',
      '2.0.0-p451',
      '2.1.1',
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
