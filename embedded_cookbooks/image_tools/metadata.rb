name 'image_tools'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs tools for handling images'
long_description 'Installs tools for handling images'
version '0.0.1'

depends 'apt'

recipe 'image_tools', 'Installs default set of image handling tools'

%w[ debian ubuntu ].each { |os| supports os }
