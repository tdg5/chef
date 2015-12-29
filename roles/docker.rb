name 'docker'
description 'Role for hosts that utilize docker'
run_list [
  'recipe[docker_service]',
  'recipe[device-mapper]',
  'recipe[docker-compose]',
]
default_attributes({
})
