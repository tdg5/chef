name 'vim-gnome'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs vim-gnome package'
long_description 'Installs vim-gnome package'
version '0.0.1'

depends 'apt'

recipe 'vim-gnome', 'Installs vim-gnome package'

%w[ debian ubuntu ].each { |os| supports os }
