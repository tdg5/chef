name 'gitk'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs gitk package'
long_description 'Installs gitk package'
version '0.0.1'

depends 'apt'

recipe 'gitk', 'Installs gitk package'

%w[ debian ubuntu ].each { |os| supports os }
