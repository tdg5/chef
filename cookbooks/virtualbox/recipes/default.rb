packages = %w[
	dkms
	virtualbox-dkms
]
packages.unshift("linux-headers-#{`uname -r`}".strip)

packages.each { |pkg| package pkg }
