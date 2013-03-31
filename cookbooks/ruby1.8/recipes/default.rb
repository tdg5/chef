%w[ruby1.8 ruby1.8-dev].each {|pkg| package pkg}

bash 'remove_ruby1.8_from_alternatives' do
	code 'update-alternatives --remove ruby /usr/bin/ruby1.8'
end
