name 'screenlets'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs screenlets package'
long_description 'Installs screenlets package'
version '0.0.1'

depends 'apt'

recipe 'screenlets', 'Installs screenlets package'

%w[ debian ubuntu ].each { |os| supports os }
