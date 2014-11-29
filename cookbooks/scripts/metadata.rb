name 'scripts'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs various useful scripts'
long_description 'Installs various useful scripts'
version '0.0.1'

depends 'chrome'

recipe 'scripts', 'noop'
recipe 'scripts::web', 'Installs wrapper script to launch web browser'
recipe 'scripts::github_gem', 'Installs script to open Ruby gem in github'

%w[ debian ubuntu ].each { |os| supports os }
