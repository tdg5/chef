include_recipe  'gnome_setting'

node['gnome']['settings'].each_pair do |name, setting|
  gnome_setting name do
    action :set
    key setting['key']
    path setting['path'] if setting['path']
    schema setting['schema']
    user setting['user']
    value setting['value']
  end
end
