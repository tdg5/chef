nodejs_npm 'jsonlint' do
  not_if 'npm -g ls | grep -q jsonlint'
end
