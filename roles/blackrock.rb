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
  'recipe[android-sdk]',
]
user = group = 'tdg5'
default_attributes({
  :modprobe => {
    :blacklists => [
    ],
  },
  :rvm => {
    :branch => 'none',
    :rvmrc => {
      :rvm_trust_rvmrcs_flag => 1,
    },
    :version => '1.25.14',
    :default_ruby => '2.0.0-p353',
    :gems => {
      '2.0.0-p353' => [{
        :name => 'chef',
        :version => '11.8.2',
      }, {
        :name => 'bundler'
      },],
    },
    :global_gems => [{
      :name => 'gem-ctags',
    }],
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

