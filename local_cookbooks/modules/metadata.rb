name 'modules'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Customizes node specific module usage'
long_description 'Customizes node specific module usage'
version '0.0.1'

recipe 'modules', 'noop'
recipe 'modules::surface', 'Customizes modules loaded on surface node'

%w[ debian ubuntu ].each { |os| supports os }
