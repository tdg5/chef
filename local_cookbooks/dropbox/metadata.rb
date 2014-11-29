name 'dropbox'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs nautilus-dropbox package'
long_description 'Installs nautilus-dropbox package'
version '0.0.1'

depends 'apt'

recipe 'dropbox', 'Installs nautilus-dropbox package'

%w[ debian ubuntu ].each { |os| supports os }
