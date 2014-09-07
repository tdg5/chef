name 'docker'
description 'Role for hosts that utilize docker'
run_list [
  'recipe[docker]',
]
default_attributes({
  'docker' => {
    'package' => {
      'repo_url' => 'https://get.docker.io/ubuntu',
    },
    'version' => '1.2.0',
  },
})
