%w[
  gir1.2-gtop-2.0
  gir1.2-networkmanager-1.0
  libglib2.0-dev
  gnome-common
].each { |pkg| package pkg }

extensions = node['gnome']['extensions']
unless extensions.nil? || extensions.empty?
  user_username = node.user.username
  user_group = node.user.group
  gnome_shell_dir = "/home/#{user_username}/.local/share/gnome-shell"
  extensions_src_dir = File.join(gnome_shell_dir, 'extensions_src')
  extensions_dir = File.join(gnome_shell_dir, 'extensions')
  enabled_extensions = []

  [extensions_dir, extensions_src_dir].each do |dir|
    directory dir do
      group user_group
      mode 0750
      owner user_username
      recursive true
    end
  end

  extensions.each_pair do |nickname, extension|
    enabled_extensions << name = extension['name']

    if repository_url = extension['git']
      extension_src_dir = File.join(extensions_src_dir, name)
      extension_dir = File.join(extensions_dir, name)
      install_script = extension['install_script']
      install_script_id = "install_#{nickname}_gnome_shell_extension"

      git extension_src_dir do
        group user_group
        repository repository_url
        revision extension['revision'] if extension['revision']
        user user_username
        notifies :run, "bash[#{install_script_id}]" if install_script
      end

      if install_script
        script_options = {
          'cwd' => extension_src_dir,
          'user' => user_username,
        }.merge(install_script)

        bash install_script_id do
          action :nothing
          script_options.each_pair do |key, value|
            send(key, value) if respond_to?(key)
          end
        end
      end

      if link_options = extension['link']
        link_options = {} unless link_options.respond_to?(:[])
        src_path = link_options['src_path'] || ''
        link_src_path = src_path[0] == '/' ? '' : extension_src_dir
        link_src_path = File.join(link_src_path, src_path)
        link extension_dir do
          group user_group
          owner user_username
          to link_src_path
        end
      end
    end
  end

  gnome_setting 'enabled_extensions' do
    action :set
    key 'enabled-extensions'
    schema 'org.gnome.shell'
    user user_username
    value enabled_extensions
  end
end
