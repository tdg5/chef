name 'grub'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Manage node specific grub configuration'
long_description 'Manage node specific grub configuration'
version '0.0.1'

recipe 'grub', 'noop'
recipe 'grub::blackrock', 'Installs grub config for blackrock to fix brightness controls'

%w[ debian ubuntu ].each { |os| supports os }
