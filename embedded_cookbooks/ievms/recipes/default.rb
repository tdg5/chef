package 'unrar'
package 'curl'

bash 'install ievms' do
  command [
    'curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh',
    '|',
    %Q[env IEVMS_VERSIONS="#{node['ievms']['versions']}" bash]
  ].join(' ')
  user node['user']['username']
end
