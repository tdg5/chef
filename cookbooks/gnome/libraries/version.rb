module GnomeVersion

  def gnome_version
    patched_version = `apt-cache show gnome-session | awk '/Version/ { print $2 }'`.strip
    # Cut patch and keep only x.y.z
    version = patched_version.scan(/\d+\.\d+(?:\.\d+)?/).first
    return version || '0.0'
  end


  def gnome_version_constraint(constraint)
    version = gnome_version
    return Chef::VersionConstraint.new('> 0.0').include?(version) &&
      Chef::VersionConstraint.new(constraint).include?(version)
  end

end

class Chef::Recipe::GnomeVersion
  extend GnomeVersion
end
