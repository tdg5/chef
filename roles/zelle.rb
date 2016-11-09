name 'zelle'
description 'Role for zelle specifics'
run_list [
  'role[dev]',
  'role[postgres]',
  'role[vm_foundry]',
  'recipe[qt::dev]',
  'role[design]',
  'role[dev]',
  'role[docker]',
  'recipe[lastpass]',
  'role[golang]',
  'recipe[modprobe::hid_apple]',
]
user = group = 'tdg5'
default_gems = [{
  :name => 'gem-ctags',
}, {
  :name => 'chef',
  :version => '11.10.4',
}, {
  :name => 'bundler'
}]
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
  'rvm' => {
    :branch => 'none',
    :default_ruby => '2.3',
    :gems => {
      '2.3' => default_gems,
      '2.3' => default_gems,
    },
    :global_gems => [{
      :name => 'gem-ctags',
    }],
    :rubies => [
      '2.3',
    ],
    :rvmrc => {
      :rvm_trust_rvmrcs_flag => 1,
      :rvmsudo_secure_path => 1,
    },
    :version => '1.25.28',
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
