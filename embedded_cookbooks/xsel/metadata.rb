name 'xsel'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs xsel package'
long_description 'Installs xsel package'
version '0.0.1'

depends 'apt'

recipe 'xsel', 'Installs xsel package'

%w[ debian ubuntu ].each { |os| supports os }
