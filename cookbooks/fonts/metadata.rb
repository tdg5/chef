name 'fonts'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Symlinks various font directories and updates font cache'
long_description 'Symlinks various font directories and updates font cache'
version '0.0.1'

depends 'dropbox'
depends 'filesystem_layout'

recipe 'fonts', 'Symlinks various font directories and updates font cache'

%w[ debian ubuntu ].each { |os| supports os }
