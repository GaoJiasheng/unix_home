Unix Home Environment
==
How to install
--
Clone environment git repo

    cd ~ && git clone https://github.com/GaoJiasheng/unix_home.git .env_home
Install config file

	cd ~/.env_home && sh install
Build & Instal Vim

    git clone https://github.com/vim/vim.git && cd vim/
    ./configure --prefix=/usr/local/vim --with-features=huge --enable-pythoninterp --enable-perlinterp --enable-rubyinterp --enable-luainterp --enable-multibyte --enable-sniff --enable-fontset --with-features=huge --enable-pythoninterp --enable-perlinterp --enable-rubyinterp --enable-luainterp --enable-multibyte --enable-sniff --enable-cscope
    make && make install

Link Vim
    
    sudo mv /bin/vim /bin/vim.bk
    echo 'export PATH=$PATH:/usr/local/vim/bin/' >> ~/.bashrc
    echo 'alias vi=vim' >> ~/.bashrc

Install Vim Plugins

    vim
    :BundleInstall

Install cmake

	yum install -y cmake  (CentOS)
	apt-get install -y cmake  (Ubuntu)
	brew install -y cmake (OSX)

Install YouCompleteMe
		
	cd ~/.vim/bundle/YouCompleteMe
	./install.sh --clang-completer --system-libclang --omnisharp-completer --gocode-completer

Install Golang Binary

	mkdir -p ~/.tools && mkdir -p ~/work/gopath && cd ~/.tools
	wget https://storage.googleapis.com/golang/go1.9.2.darwin-amd64.tar.gz (OSX)
	tar -zxvf go1.9.2.darwin-amd64.tar.gz

Install Golang Plugins
	
	vim
	:GoInstallBinaries



---------
*fork from laiwei & yubo , thanks*

