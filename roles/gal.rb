name 'gal'
description 'Role for gal specifics'
run_list [
  'role[dev]',
  'role[postgres]',
  'role[vm_foundry]',
  'recipe[qt::dev]',
  'role[design]',
  'role[docker]',
  'role[golang]',
]
user = group = 'tdg5'
home = "/home/#{user}"
default_attributes({
  :bash => {
    :bashrc => {
      :extra_sources => {
        :xtra_aliases => '~/.bash/xtra_aliases',
      },
    },
  },
  :lein => {
    :group => group,
    :home => home,
    :user => user,
  },
  :openssh => {
    :server => {
      :password_authentication => 'no',
    },
  },
  'tmux' => {
    'user_conf_group' => group,
    'user_conf_path' => "#{home}/.tmux.conf",
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
