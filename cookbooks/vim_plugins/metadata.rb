name 'vim_plugins'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs a variety of plugins for vim'
long_description 'Installs a variety of plugins for vim'
version '0.0.1'

recipe 'vim_plugins', 'Installs all vim plugin recipes'

%w[ debian ubuntu ].each { |os| supports os }
