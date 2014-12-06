FROM haskell:latest

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git vim curl cabal-install make autoconf

RUN cabal update && cabal install cabal-install && cabal install ghc-mod

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN echo -e "execute pathogen#infect() \nsyntax on\n filetype plugin indent on" >> ~/.vimrc

RUN git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim && cd ~/.vim/bundle/vimproc.vim && make

