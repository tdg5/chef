name 'blackrock'
description 'Role for blackrock specifics'
run_list [
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
  'role[nodejs]',
  'recipe[lastpass]',
  'recipe[hipchat]',
  'role[android_dev]',
]
user = group = 'tdg5'
default_gems = [{
  :name => 'chef',
  :version => '11.8.2',
}, {
  :name => 'bundler'
}, {
  :name => 'gem-ctags',
}]
default_attributes({
  :modprobe => {
    :blacklists => [
    ],
  },
  :rvm => {
    :branch => 'none',
    :rvmrc => {
      :rvm_trust_rvmrcs_flag => 1,
      :rvmsudo_secure_path => 1,
    },
    :version => '1.25.15',
    :default_ruby => '2.1.0',
    :gems => {
      '2.0.0-p353' => default_gems,
      '2.1.0' => default_gems,
    },
    :rubies => [
      '1.9.3-p484',
      '2.0.0-p353',
      '2.1.0',
    ],
  },
  'user' => {
    'username' => user,
    'email' => 'dannyguinther@gmail.com',
    'group' => group,
  },
})
