npm_package 'grunt-cli' do
  not_if 'npm -g ls | grep -q grunt-cli'
end
