name 'tree'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs tree package'
long_description 'Installs tree package'
version '0.0.1'

depends 'apt'

recipe 'tree', 'Installs tree package'

%w[ debian ubuntu ].each { |os| supports os }
