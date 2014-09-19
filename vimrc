set backspace=2
syntax on
filetype indent on 
set autoindent
set nobackup
set expandtab
set shiftwidth=2
set tabstop=2
set background=dark
set hlsearch
set t_Co=256
colorscheme diablo3

" for command mode
nmap <S-Tab> <<
" for insert mode
imap <S-Tab> <Esc><<1

execute pathogen#infect()
let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
execute "set rtp+=".s:ocamlmerlin."/vim"
execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
