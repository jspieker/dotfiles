set nocompatible                        " use vim not vi
set ttyfast                             " Assume fast terminal connection (smoothens scrolling)

" ==================================================================================================
" Vim-Plug (:PlugInstall, :PlugUpdate, :PlugUpgrade, :PlugClean)
" ==================================================================================================

" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" General
  Plug 'kien/ctrlp.vim'                                         " Fuzzy finder

" Edit
  Plug 'tpope/vim-surround'                                     " Surround selections 
  Plug 'tpope/vim-commentary'                                   " Quick commenting
  Plug 'tpope/vim-speeddating'                                  " Better number incrementation
  Plug 'tpope/vim-surround'                                     " Change surrounds

" Browsing
  Plug 'scrooloose/nerdtree'                                    " File explorer
  Plug 'Xuyuanp/nerdtree-git-plugin'                            " Git diff in nerdtree

" Git
  Plug 'airblade/vim-gitgutter'                                 " Show git diff in sidebar
  Plug 'tpope/vim-fugitive'                                     " Git wrapper

" Languages
  Plug 'sheerun/vim-polyglot'                                   " Language Packs for syntax coloring
  Plug 'neomake/neomake'                                        " Syntax Checking (Neovim only)
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocompletion engine for neovim (Neovim only)
  Plug 'mhartington/nvim-typescript'                            " Deoplete: typescript completion (Neovim only)
  Plug 'Shougo/echodoc.vim'                                     " Show function signatures in status bar (Neovim only)

" Look & feel
  Plug 'reedes/vim-thematic'                                    " Better theme management
  Plug 'vim-airline/vim-airline-themes'                         " Airline Themes
  Plug 'NLKNguyen/papercolor-theme'                             " Color Scheme
  Plug 'joshdick/onedark.vim'                                   " Color Scheme
  Plug 'junegunn/seoul256.vim'                                  " Color Scheme
  Plug 'sonph/onehalf', {'rtp': 'vim'}                          " Color Scheme
  Plug 'vim-airline/vim-airline'                                " Bottom status bar
  Plug 'yggdroot/indentline'                                    " Show indendations
  Plug 'lilydjwg/colorizer'                                     " Preview colors inline
  Plug 'itchyny/vim-cursorword'                                 " Underline word below cursor

" Experimental
  Plug 'yuttie/comfortable-motion.vim'                          " Smooth scrolling
  Plug 'kien/rainbow_parentheses.vim'                           " Rainbow Parentheses
  Plug 'christoomey/vim-tmux-navigator'                         " Seamlessly navigate in vim + tmux

" Probably deprecated
  " Plug 'ajh17/VimCompletesMe'                                 " Autocompletion
  " Plug 'vim-syntastic/syntastic'                              " Syntax checking
  " Plug 'Quramy/tsuquyomi', { 'do': 'make' }                   " Typescript plugin
  " Plug 'Shougo/vimproc.vim', { 'do': 'make' }                 " Typescript plugin

" To be added
  " Plug 'mbbill/undotree'                                      " Visualize last edits
  " Plug 'valloric/youcompleteme'                               " Autocompletion
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

filetype plugin on

set hlsearch        	        " Highlight searches
set incsearch       	        " Do incremental searching
set ruler           	        " Show the cursor position all the time
set visualbell t_vb=          " Turn off error beep/flash
set ignorecase                " Ignore case while searching
set tabstop=2							        " Set the tabs to two spaces
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set completeopt=longest,menu,preview
set autoindent
set scrolloff=5               " Keep at least x lines above/below
set sidescrolloff=5           " Keep at least x lines left/right
set hidden                    " This will go along"
set encoding=utf-8
set cursorline

" let mapleader = ","         " Remap leader to comma"

" ==================================================================================================
" Keybindings
" ==================================================================================================

:imap jk <Esc>
set timeoutlen=150

" Set Enter to exit search highlighting
nnoremap <silent> <CR> :nohlsearch<CR>

" Allow hjkl movement through wrapped lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" Rebind arrow keys to resize panes (and force usage of home row)
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

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

" Rebind git diff identifiers
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
\ }

" ==================================================================================================
" Syntastic settings
" ==================================================================================================

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" let g:syntastic_typescript_checkers = ['tslint', 'tsc']

" ==================================================================================================
" Neomake (for linter)
" ==================================================================================================

autocmd! BufWritePost * Neomake         " Autorun on every write

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

  " let g:neomake_typescript_tslint_maker = {
  " \ 'args': ['--verbose'],
  " \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
  " \ }
  let g:neomake_typescript_enabled_makers = ['tslint']
  let g:neomake_javascript_enabled_makers = ['jshint']

" ==================================================================================================
" Deoplete (Autocompletion)
" ==================================================================================================

" Disable the preview window
set completeopt-=preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1
call deoplete#enable_logging('DEBUG', '/PATH_TO/deoplete.log')

" ==================================================================================================
" UI & Themes (:Thematic)
" ==================================================================================================

syntax on                                       " Enable syntax highlighting
let base16colorspace=256
let g:indentLine_char = '│'                     " Use this char for indentations (NERDTree, indentations,...)
set noshowmode                                  " Disable --INSERT--... labels in favor of airline
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set fillchars=vert:│

let g:airline_powerline_fonts = 1               " Allow vim-airline to use Powerline Fonts
let g:thematic#theme_name = 'papercolor_light'  " Default Theme

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
      \  'seoul_light': {
      \    'colorscheme': 'seoul256-light',
      \    'airline-theme': 'papercolor',
      \    'background': 'light',
      \    'laststatus': 2,
      \    'typeface': 'Menlo for Powerline',
      \    'font-size': 16,
      \    'linespace': 2,
      \    },
      \  'onehalf': {
      \    'colorscheme': 'onehalflight',
      \    'airline-theme': 'onehalfdark',
      \    'laststatus': 2,
      \    'typeface': 'Menlo for Powerline',
      \    'font-size': 16,
      \    'linespace': 2,
      \    },
      \}


