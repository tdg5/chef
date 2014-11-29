name 'ruboto'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs ruboto gem'
long_description 'Installs ruboto gem'
version '0.0.1'

depends 'rvm'

recipe 'ruboto', 'Installs ruboto gem via RVM'

%w[ debian ubuntu ].each { |os| supports os }
