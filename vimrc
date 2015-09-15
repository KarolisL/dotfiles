set background=dark
set mouse=a

filetype plugin indent on     " Required!
set autoindent
set backspace=2 " make backspace work like most other apps
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set number
au FileType yaml setlocal shiftwidth=2 tabstop=2
syntax on

set modeline
set modelines=5

" Highlight search
set hls

set t_Co=256
