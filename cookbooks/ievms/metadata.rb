name 'ievms'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs ievms virtual machines and dependencies'
long_description 'Installs ievms virtual machines and dependencies'
version '0.0.1'

depends 'apt'

recipe 'ievms', 'Installs ievms virtual machines and dependencies'

%w[ debian ubuntu ].each { |os| supports os }
