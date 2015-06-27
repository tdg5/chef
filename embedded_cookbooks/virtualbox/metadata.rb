name 'virtualbox'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs DKMS version of VirtualBox with Guest Additions ISO'
long_description 'Installs DKMS version of VirtualBox with Guest Additions ISO'
version '0.0.1'

depends 'apt'

recipe 'virtualbox', 'Installs DKMS version of VirtualBox with Guest Additions ISO'

%w[ debian ubuntu ].each { |os| supports os }
