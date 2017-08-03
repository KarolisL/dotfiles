" TODO: vim: foldmethod=marker
" Install plugins with vim +PluginInstall +qal
"

" {{{ Vundle (plugins)
" required for vundle
filetype off
"   {{{ set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"   }}}

"   {{{ Plugin list 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'gnupg.vim'
Plugin 'vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'


Plugin 'kien/ctrlp.vim' " Navigate/find files/buffers, etc
"   }}}

"   {{{ Examples of loading plugins 
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
"   }}}

"   {{{ All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"   }}}

"   {{{ Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"   }}}
" }}}

" {{{ General settings
set background=dark
set mouse=a

filetype plugin indent on     " Required!
set autoindent

"   {{{ make backspace work like most other apps
set backspace=2
"   }}}

"   {{{ Tabs
set tabstop=4
set shiftwidth=4
set expandtab
"   }}}
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

"   {{{ Highlight begining whitespace
highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
"   }}}
"   {{{ Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
"   }}}

" Use OSX system clipboard
set clipboard=unnamed

" }}}

" {{{ Folding
"   {{{ Bind space to fold/unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
"   }}}
" }}}

" {{{ Nnerd tree
"   {{{ start nerd tree if no files are open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"   }}}
"   {{{ bind nerd-tree to ctrl+n
map <C-n> :NERDTreeToggle<CR>
"   }}}
" }}}
" {{{ Dealing with splits
"   {{{ Keybindings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"   }}}
"   {{{ More natural split opening - Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright
"   }}}
" }}}
