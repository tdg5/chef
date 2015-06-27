name 'wmctrl'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs wmctrl package'
long_description 'Installs wmctrl package'
version '0.0.1'

depends 'apt'

recipe 'wmctrl', 'Installs wmctrl package'

%w[ debian ubuntu ].each { |os| supports os }
