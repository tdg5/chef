name 'liquidprompt'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs liquidprompt adaptive prompt'
long_description 'Installs liquidprompt adaptive prompt'
version '0.0.1'

recipe 'liquidprompt', 'Installs liquidprompt adaptive prompt'

%w[ debian ubuntu ].each { |os| supports os }
