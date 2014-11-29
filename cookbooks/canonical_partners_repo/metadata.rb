name 'canonical_partners_repo'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Adds Canonical partner apt repository.'
long_description 'Adds Canonical partner apt repository.'
version '0.0.1'

depends 'apt'

recipe 'canonical_partners_repo', 'Adds Canonical partner apt repository.'

%w[ ubuntu ].each { |os| supports os }
