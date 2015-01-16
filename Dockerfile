FROM ubuntu:14.10

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y git vim curl cabal-install \
	make autoconf wget tar zlib1g-dev alex happy \
	docker.io

RUN cd /var/tmp && wget https://www.haskell.org/ghc/dist/7.8.4/ghc-7.8.4-x86_64-unknown-linux-deb7.tar.bz2

RUN cd /var/tmp && tar xvf ghc-7.8.4-x86_64-unknown-linux-deb7.tar.bz2

RUN cd /var/tmp && cd ghc-7.8.4 && sh configure && make install && rm -rf ghc-7.8.4 ghc-7.8.4-x86_64-unknown-linux-deb7.tar.bz2

RUN cabal update 

RUN cabal install cabal-install 

RUN export LANG=C.UTF-8 && cabal install ghc-mod-5.2.1.2

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim && cd ~/.vim/bundle/vimproc.vim && make

RUN git clone https://github.com/eagletmt/ghcmod-vim ~/.vim/bundle/ghcmod-vim

ADD vimrc /root/.vimrc

RUN mkdir /opt/repos

ADD setenv.sh env.conf /var/tmp/

RUN cd /var/tmp && bash setenv.sh

EXPOSE 8000

