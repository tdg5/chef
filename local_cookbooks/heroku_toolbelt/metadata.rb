name 'heroku_toolbelt'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs Heroku Toolbelt repository and package'
long_description 'Installs Heroku Toolbelt repository and package'
version '0.0.1'

depends 'apt'

recipe 'heroku_toolbelt', 'Installs Heroku Toolbelt repository and package'

%w[ ubuntu ].each { |os| supports os }
