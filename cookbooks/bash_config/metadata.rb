name 'bash_config'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs bash configuration, alias, and completion files'
long_description 'Installs bash configuration, alias, and completion files'
version '0.0.1'

recipe 'bash_config', 'Installs bash configuration, alias, and completion files'

%w[ debian ubuntu ].each { |os| supports os }
