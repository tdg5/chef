name 'jsonlint'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs jsonlint npm package'
long_description 'Installs jsonlint npm package'
version '0.0.1'

depends 'nodejs'

recipe 'jsonlint', 'Installs jsonlint npm package'

%w[ debian ubuntu ].each { |os| supports os }
