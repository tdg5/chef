name 'bup_wrapper'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Handles bup node specific config'
long_description 'Handles bup node specific config'
version '0.0.1'

depends 'hostsfile'

recipe 'bup_wrapper', 'Adds hostsfile entry and installs dependencies'

%w[ debian ubuntu ].each { |os| supports os }
