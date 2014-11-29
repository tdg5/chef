name 'skype'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs packages for Skype'
long_description 'Installs packages for Skype'
version '0.0.1'

depends 'apt'
depends 'canonical_partners_repo'

recipe 'skype', 'Installs packages for Skype'

%w[ ubuntu ].each { |os| supports os }
