name 'pidgin'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs pidgin package'
long_description 'Installs pidgin package'
version '0.0.1'

depends 'apt'

recipe 'pidgin', 'Installs pidgin package'

%w[ debian ubuntu ].each { |os| supports os }
