execute pathogen#infect()
filetype off
syntax on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set background=dark

let $PATH = $PATH . ':' . expand('~/.cabal/bin')

autocmd BufWritePre * :%s/\s\+$//e

map mc :GhcModCheckAsync<CR>
map ml :GhcModLintAsync <CR>
map mt :GhcModType      <CR>
map mi :GhcModInfo      <CR>
