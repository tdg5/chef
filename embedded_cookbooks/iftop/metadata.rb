name 'iftop'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs iftop package'
long_description 'Installs iftop package'
version '0.0.1'

depends 'apt'

recipe 'iftop', 'Installs iftop package'

%w[ debian ubuntu ].each { |os| supports os }
