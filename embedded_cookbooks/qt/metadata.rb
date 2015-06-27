name 'qt'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs qt dev packages'
long_description 'Installs qt dev packages'
version '0.0.1'

depends 'apt'

recipe 'qt', 'noop'
recipe 'qt::dev', 'Installs qt dev packages'

%w[ debian ubuntu ].each { |os| supports os }
