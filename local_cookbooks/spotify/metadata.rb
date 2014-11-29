name 'spotify'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs spotify apt repo and package'
long_description 'Installs spotify apt repo and package'
version '0.0.1'

depends 'apt'

recipe 'spotify', 'Installs spotify apt repo and package'

%w[ debian ubuntu ].each { |os| supports os }
