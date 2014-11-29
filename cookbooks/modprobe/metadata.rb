name 'modprobe'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Manages modprobe blacklists and other configurations'
long_description 'Manages modprobe blacklists and other configurations'
version '0.0.1'

recipe 'modprobe', 'Manages modprobe blacklists and other configurations'

%w[ debian ubuntu ].each { |os| supports os }
