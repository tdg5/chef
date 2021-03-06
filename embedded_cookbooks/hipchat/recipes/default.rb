release = node['lsb']['codename']

apt_repository 'atlassian-hipchat' do
  components [release, "main"]
  key 'https://atlassian.artifactoryonline.com/atlassian/api/gpg/key/public'
  not_if 'apt-cache policy | grep -q hipchat-apt-client'
  uri 'https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client'
end

package 'hipchat'
