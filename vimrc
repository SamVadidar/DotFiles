" Vim Config

set encoding=utf-8
set belloff=all
" ===========================================================================
" Mapping

let mapleader = " "

nmap <leader>so :source $MYVIMRC<cr>
nmap <leader><Enter> i<Enter><Esc>
nmap <leader><Tab> a<Tab><Esc>
nmap <leader><leader> li<Space><Esc>h
map <leader>l :wincmd l<CR>
map <leader>j :wincmd j<CR>
map <leader>h :wincmd h<CR>
map <leader>k :wincmd k<CR>

"deactive relative number
map <leader>R :RltvNmbr!<CR>
"active relative number
map <leader>r :RltvNmbr<CR>

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

"Press F9 to run the current python script
autocmd FileType python map <buffer> <leader>g :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <leader>g <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

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

Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'

" for relative line number
Plug 'vim-scripts/RltvNmbr.vim'
" for paranthesis
Plug 'luochen1990/rainbow'
" Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
" Code commenter
"Plug 'scrooloose/nerdcommenter'
" Better file browser
Plug 'scrooloose/nerdtree'
" Class/module browser
"Plug 'majutsushi/tagbar'
" Search results counter
"Plug 'vim-scripts/IndexedSearch'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Git integration
"Plug 'tpope/vim-fugitive'
" Surround
"Plug 'tpope/vim-surround'
" Repeat the previous command
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-commentary'
" Plug 'joshdick/onedark.vim'
" Colorscheme
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Powerline
"Plug 'powerline/powerline'
" Python autocompletion
Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Just to add the python go-to-definition and similar features
" autocompletion from this plugin is disabled
Plug 'davidhalter/jedi-vim'
" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'
" Linters
"Plug 'neomake/neomake'
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
"Plug 't9md/vim-choosewin'
" Automatically sort python imports
"Plug 'fisadev/vim-isort'
" Yank history navigation
"Plug 'vim-scripts/YankRing.vim'
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
colorscheme gruvbox 
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

" To use fancy symbols wherever possible, change this setting from 0 to 1
" and use a font from https://github.com/ryanoasis/nerd-fonts in your terminal
" (if you aren't using one of those fonts, you will see funny characters here.
" Turst me, they look nice when using one of those fonts).
let fancy_symbols_enabled = 0

"python with virtualenv support
python3<<EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    with open(activate_this) as f:
        code = compile(f.read(), activate_this, 'exec')
        exec(code, dict(__file__=activate_this))
EOF

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

" Fancy Symbols!!

if fancy_symbols_enabled
    let g:webdevicons_enable = 1

    " custom airline symbols
    if !exists('g:airline_symbols')
       let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
else
    let g:webdevicons_enable = 0
endif

"" enable/disable virtualenv integration
"let g:airline#extensions#virtualenv#enabled = 1
"
""" Neomake ------------------------------
""
""" Run linter on write
""autocmd! BufWritePost * Neomake
""
""" Check code as python3 by default
""let g:neomake_python_python_maker = neomake#makers#ft#python#python()
""let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
""let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
""let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'
""
""" Disable error messages inside the buffer, next to the problematic line
""let g:neomake_virtualtext_current_error = 0
""
" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>




