" Vim Config

set encoding=utf-8
" ===========================================================================
" Mapping

let mapleader = "\<Space>"

nmap <leader>so :source $MYVIMRC<cr>
nmap <leader><Enter> i<Enter><Esc>
nmap <leader><leader> li<Space>h<Esc>
map <leader>l >
map <leader>h =

"split stuff
map <leader>s :vsplit <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <leader>e :e <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
set splitright
set splitbelow

"new tab stuff
map <leader>t :tabedit <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nmap <leader>vi :tabe $MYVIMRC<cr>

" Mapping in insert mode from Esc to jj, then save the file
" CR stands for Carriage Return (Enter key)"
imap jj <Esc>:w<CR>
nmap k gk
nmap j gj

" Typoed commands
command! Q q
command! W w
command! Qall qall
command! QA qall
command! E e

" ===========================================================================
" Vim plugin 

" this needs to be here, so vim-plug knows we are declaring the plugins
call plug#begin('~/.vim/plugged')

Plug 'luochen1990/rainbow'
" Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Better file browser
Plug 'scrooloose/nerdtree'
" Class/module browser
Plug 'majutsushi/tagbar'
" Search results counter
Plug 'vim-scripts/IndexedSearch'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Git integration
Plug 'tpope/vim-fugitive'
" Surround
Plug 'tpope/vim-surround'
" Repeat the previous command
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-commentary'
" Plug 'joshdick/onedark.vim'
" Colorscheme
Plug 'tomasr/molokai'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Python autocompletion
Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'
" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'
" Linters
Plug 'neomake/neomake'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" Better language packs
Plug 'sheerun/vim-polyglot'
" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" Window chooser
Plug 't9md/vim-choosewin'
" Automatically sort python imports
Plug 'fisadev/vim-isort'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ===========================================================================
" Vim settings and mappings
" You can edit them as you wish
 
" better backup, swap and undos storage for vim (nvim has nice ones by
" default)
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" no vi-compatible
set nocompatible
set number 
set wildmenu
set lazyredraw
set autoindent
set smartindent
set nowrap
set textwidth=0
set noswapfile

" When scrolling, keep the cursor 10 lines away from the screen border
set scrolloff=10
set foldmethod=indent   "Enable folding
set foldlevel=99        "Enable folding

" clear search results
nnoremap <silent> // :noh<CR>

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
colorscheme vim-monokai-tasty 
set background=dark

let g:SimpylFold_docstring_preview=1
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" syntax highlight on
syntax on
let python_highlight_all=1

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" remove ugly vertical lines on window division
set fillchars+=vert:\ 

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" color the white space in red (warning)
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

"au BufNewFile,Bufread *.py
" tabs and spaces handling
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set fileformat=unix 

" ===========================================================================
" Vim settings and mappings
" You can edit them as you wish

" folding
nmap <leader>f za   "za works for folding/unfolding the methods/classes

" NERDTree -----------------------------
map <leader><C-t> :NERDTree<CR>

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

