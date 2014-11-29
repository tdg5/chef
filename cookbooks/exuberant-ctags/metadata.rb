name 'exuberant-ctags'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs exuberant-ctags package'
long_description 'Installs exuberant-ctags package'
version '0.0.1'

depends 'apt'

recipe 'exuberant-ctags', 'Installs exuberant-ctags package'

%w[ debian ubuntu ].each { |os| supports os }
