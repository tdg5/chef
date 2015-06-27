name 'thunar'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs thunar file manager.'
long_description 'Installs thunar file manager.'
version '0.0.1'

depends 'apt'

recipe 'thunar', 'Installs thunar file manager.'

%w[ ubuntu ].each { |os| supports os }
