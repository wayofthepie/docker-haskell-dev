FROM haskell:latest

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git vim curl cabal-install

RUN cabal update && cabal install cabal-install

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
