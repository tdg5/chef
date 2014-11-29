name 'grunt'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs grunt npm pacakge'
long_description 'Installs grunt npm pacakge'
version '0.0.1'

depends 'nodejs'

recipe 'grunt', 'Installs grunt npm package'

%w[ debian ubuntu ].each { |os| supports os }
