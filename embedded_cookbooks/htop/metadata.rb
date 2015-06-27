name 'htop'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs htop package'
long_description 'Installs htop package'
version '0.0.1'

depends 'apt'

recipe 'htop', 'Installs htop package'

%w[ debian ubuntu ].each { |os| supports os }
