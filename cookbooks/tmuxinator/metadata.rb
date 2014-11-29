name 'tmuxinator'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs tmuxinator gem'
long_description 'Installs tmuxinator gem'
version '0.0.1'

depends 'rvm'

recipe 'tmuxinator', 'Installs tmuxinator gem via RVM'

%w[ debian ubuntu ].each { |os| supports os }
