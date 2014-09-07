require 'etc'
require 'fileutils'

HDD_PATH='/media/hdd'

directory HDD_PATH do
  group node.user.group
  owner node.user.username
  mode 0775
end

group = Etc.getgrnam(node.user.group)
user = Etc.getpwnam(node.user.group)

mount '/media/hdd' do
  action [:mount, :enable]
  device '92F48F5FF48F4487'
  device_type :uuid
  fstype 'ntfs'
  options "gid=#{group.gid},rw,uid=#{user.uid},umask=0002"
end

home_dir = user.dir
documents_dir = "#{home_dir}/Documents"
downloads_dir = "#{home_dir}/Downloads"
music_dir = "#{home_dir}/Music"
pictures_dir = "#{home_dir}/Pictures"
projects_dir = "#{home_dir}/projects"
videos_dir = "#{home_dir}/Videos"
directories_to_delete = [
  documents_dir,
  downloads_dir,
  music_dir,
  pictures_dir,
  videos_dir,
]

directories_to_delete.each {|dir| FileUtils.rmdir(dir) if File.exists?(dir) && !File.symlink?(dir) && Dir.entries(dir).length == 2 }

dropbox_dir = "#{home_dir}/Dropbox"
symlinks = {
  documents_dir => "#{HDD_PATH}/Documents",
  downloads_dir => "#{HDD_PATH}/Downloads",
  dropbox_dir => "#{HDD_PATH}/Dropbox",
  music_dir => "#{HDD_PATH}/Music",
  pictures_dir => "#{HDD_PATH}/Pictures",
  projects_dir => "#{HDD_PATH}/Projects",
  videos_dir => "#{HDD_PATH}/Videos",
}

symlinks.each do |symlink_path, to_path|
  link symlink_path do
    group node.user.group
    to to_path
    user node.user.username
  end
end
