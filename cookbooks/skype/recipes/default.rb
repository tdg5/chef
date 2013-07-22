include_recipe 'canonical_partners_repo'

%w[skype-bin skype].each do |pkg|
	package pkg
end
