name 'powertop'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs powertop package and manages power tuning'
long_description 'Installs powertop package and manages power tuning'
version '0.0.1'

depends 'apt'

recipe 'powertop', 'Installs powertop package'
recipe 'powertop::powertune', 'Installs service to perform powertune optimizations at boot'

%w[ debian ubuntu ].each { |os| supports os }
