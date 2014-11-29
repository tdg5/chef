name 'chrome'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs chrome package on Debian systems'
long_description 'Installs chrome package on Debian systems'
version '0.0.1'

depends 'wmctrl'

recipe 'chrome', 'Installs chrome package on Debian systems'

%w[ debian ubuntu ].each { |os| supports os }
