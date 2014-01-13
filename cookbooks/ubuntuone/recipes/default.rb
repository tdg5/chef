packages = %w[
  ubuntuone-control-panel-common
  ubuntuone-control-panel-qt
]

if node['platform'] == 'ubuntu' && Chef::VersionConstraint.new('< 13.10').include?(node['platform_version'])
  packages.each do |pkg|
    package pkg
  end
end
