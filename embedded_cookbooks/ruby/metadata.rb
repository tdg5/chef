name 'ruby'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs ruby package on Debian systems'
long_description 'Installs ruby package on Debian systems'
version '0.0.1'

depends 'apt'

recipe 'ruby', 'Installs ruby packages'

%w[ debian ubuntu ].each { |os| supports os }
