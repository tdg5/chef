name 'hipchat'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs atlassian-hipchat repo and hipchat package'
long_description 'Installs atlassian-hipchat repo and hipchat package'
version '0.0.1'

depends 'apt'

recipe 'hipchat', 'Installs atlassian-hipchat repo and hipchat package'

%w[ debian ubuntu ].each { |os| supports os }
