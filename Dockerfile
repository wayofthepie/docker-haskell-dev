FROM haskell:latest

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git vim curl cabal-install make autoconf wget

RUN cabal update && cabal install cabal-install && cabal install ghc-mod

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN echo "execute pathogen#infect() \nsyntax on \nfiletype plugin indent on" >> ~/.vimrc

RUN echo "\nset tabstop=4 \nset shiftwidth=4 \nset softtabstop=4 \nset smarttab \nset expandtab \n" >> ~/.vimrc

RUN git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim && cd ~/.vim/bundle/vimproc.vim && make

RUN git clone https://github.com/eagletmt/ghcmod-vim ~/.vim/bundle/ghcmod-vim

RUN mkdir /opt/repos

EXPOSE 8000

