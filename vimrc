set nocompatible                        " use vim not vi
set ttyfast                             " Assume fast terminal connection (smoothens scrolling)

" ==================================================================================================
" Vim-Plug (:PlugInstall, :PlugUpdate, :PlugClean)
" ==================================================================================================

" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" General
  Plug 'kien/ctrlp.vim'                 " Fuzzy finder

" Edit
  Plug 'tpope/vim-surround'             " Surround selections 
  Plug 'tpope/vim-commentary'           " Quick commenting
  Plug 'tpope/vim-speeddating'          " Better number incrementation
  Plug 'tpope/vim-surround'             " Change surrounds

" Browsing
  Plug 'scrooloose/nerdtree'            " File explorer

" Git
  Plug 'airblade/vim-gitgutter'         " Show git diff in sidebar
  Plug 'tpope/vim-fugitive'             " Git wrapper

" Languages
  Plug 'sheerun/vim-polyglot'           " Language Packs for syntax coloring

" Look & feel
  Plug 'reedes/vim-thematic'            " Better theme management
  Plug 'vim-airline/vim-airline-themes' " Airline Themes
  Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim'}    " Color Scheme
  Plug 'NLKNguyen/papercolor-theme'     " Color Scheme
  Plug 'andbar-ru/vim-unicon'           " Color Scheme
  Plug 'joshdick/onedark.vim'           " Color Scheme
  Plug 'vim-airline/vim-airline'        " Bottom status bar
  Plug 'yggdroot/indentline'            " Show indendations
  Plug 'lilydjwg/colorizer'             " Preview colors inline
  Plug 'itchyny/vim-cursorword'         " Underline word below cursor

" Experimental
  Plug 'yuttie/comfortable-motion.vim'  " Smooth scrolling
  Plug 'kien/rainbow_parentheses.vim'   " Rainbow Parentheses
  Plug 'vim-syntastic/syntastic'        " Syntax checking



" To be added
  " Plug 'mbbill/undotree'          " Visualize last edits
  " Plug 'valloric/youcompleteme'   " Autocompletion
call plug#end()


" ==================================================================================================
" Basic settings
" ==================================================================================================

set relativenumber            " Relative line numbers
set number                    " Activate line numbers
set wrap                      " Allow line-breaking
set linebreak                 " Allow word wrapping
" set fo=tcrwa textwidth=80   " Autoformats display line to new line
set mouse=a                   " Allow mouse control
set path+=**                  " Search down into subfolders
set wildmenu                  " Display all matching files when tab complete

" Allow hjkl movement through wrapped lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

filetype plugin on

set hlsearch        	        " Highlight searches
set incsearch       	        " Do incremental searching
set ruler           	        " Show the cursor position all the time
set visualbell t_vb=          " Turn off error beep/flash
set ignorecase                " Ignore case while searching
set ts=2							        " Set the tabs to two spaces
set expandtab
set shiftwidth=2
set tabstop=2
set backspace=indent,eol,start
set completeopt=longest,menu,preview
set autoindent
set scrolloff=5               " Keep at least x lines above/below
set sidescrolloff=5           " Keep at least x lines left/right
set hidden                    " This will go along"
set encoding=utf-8

" let mapleader = ","         " Remap leader to comma"
let base16colorspace=256


" ==================================================================================================
" Keybindings
" ==================================================================================================

:imap jk <Esc>
set timeoutlen=150

" Set Enter to exit search highlighting
nnoremap <silent> <CR> :nohlsearch<CR>

" ==================================================================================================
" CTRL+P (fuzzy search)
" ==================================================================================================

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP' 

" Ignore certain files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }


" ==================================================================================================
" Nerdtree
" ==================================================================================================

let NERDTreeMinimalUI = 1     " Suppress 'Press ? for help' message

" Toggle NERDTree
map <F5> :NERDTreeToggle<CR> 

" Autoclose NERDTree if it is last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto open nerdtree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ==================================================================================================
" Syntastic settings
" ==================================================================================================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_typescript_checkers = ['tslint', 'tsc']

" ==================================================================================================
" Themes (:Thematic)
" ==================================================================================================
syntax on                             " Enable syntax highlighting
let g:indentLine_char = '⎸'           " Use this char for indentations
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

let g:airline_powerline_fonts = 1     " Allow vim-airline to use Powerline Fonts
let g:thematic#theme_name = 'onedark' " Default Theme

let g:thematic#themes = {
      \  'onedark': {
      \    'colorscheme': 'onedark',
      \    'airline-theme': 'onedark',
      \    'background': 'dark',
      \    'laststatus': 2,
      \    'typeface': 'Menlo for Powerline',
      \    'font-size': 16,
      \    'linespace': 2,
      \    },
      \  'papercolor_light': {
      \    'colorscheme': 'PaperColor',
      \    'airline-theme': 'papercolor',
      \    'background': 'light',
      \    'laststatus': 2,
      \    'typeface': 'Menlo for Powerline',
      \    'font-size': 16,
      \    'linespace': 2,
      \    },
      \  'tomorrow': {
      \    'colorscheme': 'Tomorrow',
      \    'airline-theme': 'papercolor',
      \    'background': 'light',
      \    'laststatus': 2,
      \    'typeface': 'Menlo for Powerline',
      \    'font-size': 16,
      \    'linespace': 2,
      \    },
      \}

