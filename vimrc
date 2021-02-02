"Vim Config

"============================================================================

let mapleader = "\<Space>"

"Some mapping
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader><Enter> o<Esc>
nmap <leader><leader> li<Space><Esc>
map <leader>l >
map <leader>h =
nmap <leader>f za   "za works for folding/unfolding the methods/classes

"split stuff
map <leader>s :vsplit <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <leader>e :e <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <leader><C-t> :NERDTree<CR>
set splitright
set splitbelow

"new tab stuff
map <leader>t :tabedit <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nmap <leader>vi :tabe $MYVIMRC<cr>

"Mapping in insert mode from Esc to jj, then save the file
"CR stands for Carriage Return (Enter key)"
imap jj <Esc>:w<CR>
nmap k gk
nmap j gj


"============================================================================



"============================================================================

"Vim plugin manager
call plug#begin('~/.vim/plugged')

Plug 'luochen1990/rainbow'
"Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'powerline/powerline'
"Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'

call plug#end()

"============================================================================

" Vim settings and mappings
" You can edit them as you wish
 
" A bunch of things that are set by default in neovim, but not in vim

" no vi-compatible
set nocompatible
set number 
set wildmenu
set lazyredraw
set autoindent
set smartindent
set nowrap
set noswapfile

set scrolloff=10
set foldmethod=indent   "Enable folding
set foldlevel=99        "Enable folding

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" for rainbow parentheses
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"let g:airline_theme='onedark'
colorscheme badwolf
set background=dark

let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" syntax highlight on
syntax on
let python_highlight_all=1

"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"  set background=dark
"endif
" remove ugly vertical lines on window division
set fillchars+=vert:\ 


"============================================================================

" clear empty spaces at the end of lines on save of python files
"autocmd BufWritePre *.py :%s/\s\+$//e
" color the white space in red (warning)
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

"au BufNewFile,Bufread *.py
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set fileformat=unix 
set encoding=utf-8


"============================================================================

