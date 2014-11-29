name 'gimp'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs otto-kesselgulasch gimp apt repo and gimp package'
long_description 'Installs otto-kesselgulasch gimp apt repo and gimp package'
version '0.0.1'

depends 'apt'

recipe 'gimp', 'Installs otto-kesselgulasch gimp apt repo and gimp package'

%w[ ubuntu ].each { |os| supports os }
