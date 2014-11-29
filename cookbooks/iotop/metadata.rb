name 'iotop'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs iotop package'
long_description 'Installs iotop package'
version '0.0.1'

depends 'apt'

recipe 'iotop', 'Installs iotop package'

%w[ debian ubuntu ].each { |os| supports os }
