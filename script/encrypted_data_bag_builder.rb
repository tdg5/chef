require 'rubygems'
require 'chef/encrypted_data_bag_item'

secret = Chef::EncryptedDataBagItem.load_secret('')
data = {
  'id' => '',
}
encrypted_data = Chef::EncryptedDataBagItem.encrypt_data_bag_item(data, secret)

FileUtils.mkpath('')
File.open('', 'w') do |f|
  f.print encrypted_data.to_json
end
