repo_uri = 'http://toolbelt.heroku.com/ubuntu'
apt_repository 'heroku' do
  distribution './'
  uri repo_uri
  key 'https://toolbelt.heroku.com/apt/release.key'
  not_if "apt-cache policy | grep -q '#{repo_uri}'"
end

package 'heroku-toolbelt'
