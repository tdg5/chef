name 'oracle_java'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs oracle java'
long_description 'Installs oracle java'
version '0.0.1'

depends 'apt'

recipe 'oracle_java', 'Installs oracle java'

%w[ debian ubuntu ].each { |os| supports os }
