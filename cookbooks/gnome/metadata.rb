name 'gnome'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Installs and customizes Gnome shell, extenstions, and tools.'
long_description 'Installs and customizes Gnome shell, extenstions, and tools.'
version '0.0.1'

depends 'gnome_setting'

recipe 'gnome', 'Install gnome-shell and all extensions, tools, and cusomizations.'
recipe 'gnome::settings', 'Install gnome-shell and all extensions, tools, and cusomizations.'

%w[ debian ubuntu ].each { |os| supports os }

