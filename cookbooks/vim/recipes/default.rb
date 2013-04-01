%w[
	libatk1.0-dev
	libbonoboui2-dev
	libcairo2-dev
	libgnome2-dev
	libgnomeui-dev
	libgtk2.0-dev
	libncurses5-dev
	libx11-dev
	libxpm-dev
	libxt-dev
	mercurial
	python-dev
	ruby-dev
].each do |pkg|
	package pkg
end

%w[vim vim-gnome vim-runtime].each do |pkg|
	package pkg do
		action :remove
	end
end

bash 'clone_and_build_vim' do
	code <<-CODE
		hg clone https://code.google.com/p/vim/
		cd vim
		./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-gui=gtk2 --enable-cscope --prefix=/usr
		make VIMRUNTIMEDIR=/usr/share/vim/vim73
		sudo make install
		update-alternatives --install /usr/bin/vi vi /usr/bin/vim 11
		update-alternatives --set vi /usr/bin/vim
	CODE
	cwd '/tmp'
	not_if 'vim --version |grep -q "Included patches: 1-875"'
	user 'root'
end


