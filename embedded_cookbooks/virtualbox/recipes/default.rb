packages = %w[
  dkms
  virtualbox-dkms
  virtualbox-guest-additions-iso
]
packages.unshift("linux-headers-#{`uname -r`}".strip)

packages.each { |pkg| package pkg }
