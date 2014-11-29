name 'adb'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs android-tools-adb package'
long_description 'Installs android-tools-adb package'
version '0.0.1'

depends 'apt'

recipe 'adb', 'Installs android-tools-adb package'

%w[ debian ubuntu ].each { |os| supports os }
