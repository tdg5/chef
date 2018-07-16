name 'postgres'
description 'Role for hosts with postgresql server'
run_list [
  'recipe[postgresql::server]',
]
default_attributes({
  'postgresql' => {
    :config => {
      :listen_addresses => 'localhost',
    },
    :super_user => {
      :password => 'postgres',
      :username => 'postgres',
    },
    :revision => nil,
    :version => '10',
  },
})
