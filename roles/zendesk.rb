name 'zendesk'
description 'Role for zendesk specifics'
run_list([
  'role[dev]',
  'role[vm_host]',
  'role[design]',
  'recipe[lastpass]',
])
user = group = 'danny'
home = "/home/#{user}"
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
  :rvm => {
    :branch => 'none',
    :default_ruby => '2.3',
    :gems => {
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
  :tmux => {
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
