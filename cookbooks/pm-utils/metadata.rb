name 'pm-utils'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Handles pm-utils configuration management'
long_description 'Handles pm-utils configuration management'
version '0.0.1'

recipe 'pm-urils', 'Handles pm-utils configuration management'

%w[ debian ubuntu ].each { |os| supports os }
