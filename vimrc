execute pathogen#infect()
filetype off
syntax on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

let $PATH = $PATH . ':' . expand('~/.cabal/bin')
