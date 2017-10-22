" ==================================================================================================
" Vim-Plug (:PlugInstall, :PlugUpdate, :PlugUpgrade, :PlugClean)
" ==================================================================================================

" Autoinstall vim-plug if its not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Editing
  Plug 'tpope/vim-surround'                                         " Surround selections
  Plug 'tpope/vim-commentary'                                       " Quick commenting
  Plug 'tpope/vim-speeddating'                                      " Better number incrementation
  Plug 'cohama/lexima.vim'                                          " Auto-close brackets

" Browsing
  Plug 'scrooloose/nerdtree'                                        " File explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'                                " Git diff in nerdtree
    Plug 'low-ghost/nerdtree-fugitive'                                " Git functionality in nerdtree (dependent on vim-fugitive)
  Plug 'easymotion/vim-easymotion'                                  " Improve text navigation
  Plug 'christoomey/vim-tmux-navigator'                             " Seamlessly navigate in vim + tmux
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
    Plug 'junegunn/fzf.vim'                                           " Additional commands for fzf in vim
    Plug 'mileszs/ack.vim'                                       " Use ag (grepper) with fzf

" Git
  Plug 'airblade/vim-gitgutter'                                     " Show git diff in sidebar
  Plug 'tpope/vim-fugitive'                                         " Git wrapper

" Languages
  Plug 'sheerun/vim-polyglot'                                       " Language Packs for syntax coloring
  if (has("nvim"))
    Plug 'w0rp/ale'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Autocompletion engine for neovim (Neovim only)
    Plug 'mhartington/nvim-typescript'                              " Deoplete: typescript completion (Neovim only)
    " Plug 'Shougo/echodoc.vim'                                       " Show function signatures in status bar (Neovim only)
  endif

" Look & feel
  Plug 'itchyny/lightline.vim'
  Plug 'yggdroot/indentline'                                        " Show indendations
  Plug 'lilydjwg/colorizer'                                         " Preview colors inline
  Plug 'itchyny/vim-cursorword'                                     " Underline word below cursor
  Plug 'NLKNguyen/papercolor-theme'                                 " Color Scheme
  Plug 'joshdick/onedark.vim'                                       " Color Scheme
  Plug 'junegunn/seoul256.vim'                                      " Color Scheme
  Plug 'jonathanfilip/vim-lucius'                                   " Color Scheme
  Plug 'rakr/vim-one'                                               " Color Scheme

" Experimental
  Plug 'terryma/vim-multiple-cursors'
  Plug 'joeytwiddle/sexy_scroller.vim'                              " Smooth scrolling
  Plug 'kien/rainbow_parentheses.vim'                               " Rainbow Parentheses

" To be added
  " Plug 'mbbill/undotree'                                          " Visualize last edits
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
set clipboard+=unnamedplus    " Yank to system clipboard

set nowrap                    " Don't fold lines
set visualbell t_vb=          " Turn off error beep/flash
set ignorecase                " Ignore case while searching
set tabstop=2							    " Set the tabs to two spaces
set shiftwidth=2
set expandtab
set completeopt=longest,menu,preview
set scrolloff=5               " Keep at least x lines above/below
set sidescrolloff=5           " Keep at least x lines left/right
set hidden                    " This will go along"
set encoding=utf-8
set cursorline
set lazyredraw

let mapleader = ","           " Remap leader to comma

" ==================================================================================================
" Keybindings
" ==================================================================================================

:imap jk <Esc>
set timeoutlen=150

" Autocomplete with fuzzy search
imap <c-x><c-l> <plug>(fzf-complete-line)

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

" Rebind ctrl+p to fzf fuzzy finder
nnoremap <c-p> :FZF<cr>

" ==================================================================================================
" Easymotion
" ==================================================================================================

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" ==================================================================================================
" FZF Fuzzy file finder
" ==================================================================================================

" How to open marked file
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable search history with ctrl+n and ctrl+p
let g:fzf_history_dir = '~/.local/share/fzf-history'

" fzf popup layout
let g:fzf_layout = { 'down': '~40%' }

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Don't automatically jump to first result
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" ==================================================================================================
" Nerdtree
" ==================================================================================================

let NERDTreeMinimalUI = 1     " Suppress 'Press ? for help' message
let NERDTreeShowHidden = 1    " Always show hidden files (toggle with I)
let NERDTreeShowLineNumbers=1 " Show line numbers

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
" ALE (Asynchronous Lint Engine)
" ==================================================================================================

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Disable HTML Tidy linter
let g:ale_linters = {
 \ 'html': ['proselint', 'HTMLHint'],
 \}

" ==================================================================================================
" Deoplete (Autocompletion)
" ==================================================================================================

if (has("nvim"))
  set completeopt-=preview                " Disable the preview window
  let g:deoplete#enable_at_startup = 1
endif

" ==================================================================================================
" Lightline
" ==================================================================================================

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
\ 'colorscheme': 'one',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" ==================================================================================================
" UI & Themes
" ==================================================================================================

set background=light
colorscheme one
let base16colorspace=256
let g:indentLine_char = '│'                     " Use this char for indentations (NERDTree, indentations,...)
set noshowmode                                  " Disable --INSERT--... labels in favor of lightline
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set fillchars=vert:│

if (has("termguicolors"))
  set termguicolors
endif

" Fix colors in tmux
if exists('$TMUX')
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" ==================================================================================================
" Vim only settings, deprecated with neovim (see https://neovim.io/doc/user/vim_diff.html)
" ==================================================================================================

if (has("nvim"))
else
  syntax on                                       " Enable syntax highlighting
  filetype plugin on
  set autoindent
  set backspace=indent,eol,start
  set hlsearch        	                          " Highlight searches
  set incsearch       	                          " Do incremental searching
  set nocompatible                                " use vim not vi
  set ruler           	                          " Show the cursor position all the time
  set ttyfast                                     " Assume fast terminal connection (smoothens scrolling)
  set wildmenu                                    " Display all matching files during tab complete
endif

