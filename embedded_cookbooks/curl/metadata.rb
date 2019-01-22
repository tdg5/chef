name 'curl'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs curl'
long_description 'Installs curl'
version '0.0.1'

depends 'apt'

recipe 'curl', 'Installs curl'

%w[ debian ubuntu ].each { |os| supports os }
