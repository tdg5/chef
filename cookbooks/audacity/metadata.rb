name 'audacity'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs audacity package'
long_description 'Installs audacity package'
version '0.0.1'

depends 'apt'

recipe 'audacity', 'Installs audacity package'

%w[ debian ubuntu ].each { |os| supports os }
