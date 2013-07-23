apt_repository 'atlassian-hipchat' do
	components %w[stable main]
	key 'https://www.hipchat.com/keys/hipchat-linux.key'
	uri 'http://downloads.hipchat.com/linux/apt'
end

package 'hipchat'
