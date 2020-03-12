name 'zen_vm'
description 'Role for zen_vm specifics'
run_list([
  'recipe[oracle_java]',
  'role[dev]',
  'role[postgres]',
  'role[design]',
  'role[docker]',
])
user = group = 'danny'
home = "/home/#{user}"
default_attributes({
  :bash => {
    :bashrc => {
      :extra_sources => {
        :extra_aliases => '~/.bash/extra_aliases',
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
  :tmux => {
    'user_conf_group' => group,
    'user_conf_path' => "#{home}/.tmux.conf",
    'user_conf_user' => user,
  },
  :user => {
    :username => user,
    :email => 'dguinther@seismic.com',
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
