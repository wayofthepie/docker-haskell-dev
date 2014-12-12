FROM ubuntu:14.10

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y git vim curl cabal-install \
	make autoconf wget tar zlib1g-dev alex happy

RUN cd /var/tmp && wget https://www.haskell.org/ghc/dist/7.8.3/ghc-7.8.3-x86_64-unknown-linux-deb7.tar.bz2

RUN cd /var/tmp && tar xvf ghc-7.8.3-x86_64-unknown-linux-deb7.tar.bz2

RUN cd /var/tmp && cd ghc-7.8.3 && sh configure && make install && rm -rf ghc-7.8.3 ghc-7.8.3-x86_64-unknown-linux-deb7.tar.bz2

RUN export LANG=C.UTF-8 && cabal update && cabal install cabal-install && cabal install ghc-mod

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim && cd ~/.vim/bundle/vimproc.vim && make

RUN git clone https://github.com/eagletmt/ghcmod-vim ~/.vim/bundle/ghcmod-vim

ADD vimrc /root/.vimrc

RUN mkdir /opt/repos

EXPOSE 8000

