name 'handbrake'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs handbrake package'
long_description 'Installs handbrake package'
version '0.0.1'

depends 'apt'

recipe 'handbrake', 'Installs handbrake package'

%w[ debian ubuntu ].each { |os| supports os }
