name 'redis'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs and configures various redis packages'
long_description 'Installs and configures various redis packages'
version '0.0.1'

depends 'apt'

recipe 'redis', 'noop'
recipe 'redis::server', 'Installs redis-server package'

%w[ debian ubuntu ].each { |os| supports os }
