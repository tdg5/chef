name 'xclip'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs xclip package'
long_description 'Installs xclip package'
version '0.0.1'

depends 'apt'

recipe 'xclip', 'Installs xclip package'

%w[ debian ubuntu ].each { |os| supports os }
