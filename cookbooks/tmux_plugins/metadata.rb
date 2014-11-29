name 'tmux_plugins'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs tpm and various tmux plugins'
long_description 'Installs tpm and various tmux plugins'
version '0.0.1'

recipe 'tmux', 'Installs tpm and various tmux plugins'

%w[ debian ubuntu ].each { |os| supports os }
