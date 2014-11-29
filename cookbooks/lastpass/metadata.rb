name 'lastpass'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs lastpass browser plugin binary'
long_description 'Installs lastpass browser plugin binary'
version '0.0.1'

recipe 'lastpass', 'Installs lastpass browser plugin binary'

%w[ debian ubuntu ].each { |os| supports os }
