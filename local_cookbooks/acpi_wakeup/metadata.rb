name 'acpi_wakeup'
maintainer 'Danny Guinther'
maintainer_email 'dannyguinther@gmail.com'
license 'MIT'
description 'Adds acpi_wakeup service to manage which devices can cause wakeup'
long_description 'Adds acpi_wakeup service to manage which devices can cause wakeup'
version '0.0.1'

recipe 'acpi_wakeup', 'Installs acpi_wakeup service for specified devices'

%w[ debian ubuntu ].each { |os| supports os }
