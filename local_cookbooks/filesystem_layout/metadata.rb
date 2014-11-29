name 'filesystem_layout'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs node specific filesystem layout'
long_description 'Installs node specific filesystem layout'
version '0.0.1'

recipe 'filesystem_layout', 'noop'
recipe 'filesystem_layout::blackrock', 'Sets up filesystem layout for blackrock node'

%w[ debian ubuntu ].each { |os| supports os }
