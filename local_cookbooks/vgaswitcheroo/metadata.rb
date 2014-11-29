name 'vgaswitcheroo'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Adds vgaswitcheroo service to control graphics card enablement'
long_description 'Adds vgaswitcheroo service to control graphics card enablement'
version '0.0.1'

recipe 'vgaswitcheroo', 'Adds and enables vgaswitcheroo service'

%w[ debian ubuntu ].each { |os| supports os }
