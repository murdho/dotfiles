" TODO: ruby code navigation
" https://www.tkalin.com/blog_posts/ide-like-go-to-declaration-in-vim/

" Make improved.
set nocompatible

" Use Pathogen for plugins
execute pathogen#infect()

" Map semicolon to colon, for speed
nnoremap ; :

" Don't modify terminal cursor.
set guicursor=

" Disable ex-mode shortcut
nnoremap Q <Nop>

" Use system clipboard
set clipboard=unnamed

" Disable swap files
set noswapfile

" Enable highlighting
syntax on

" Enable termguicolors
set termguicolors

" Enable color scheme "Ayu"
let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Disable arrow keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" Enable mouse interaction
set mouse=a

" Use spaces instead tabs
set expandtab

" Disable smarttab (on new line would enter <Tab> instead of spaces)
set nosmarttab

" Show line numbers
set nu

" Splits to right/below
set splitright
set splitbelow

" Change tab size
set tabstop=4

" Change indent size (when indenting with < and >)
set shiftwidth=4

" Make search case-insensitive
set ignorecase

" Enable filetype plugins
filetype plugin indent on

" Set leader to comma
let mapleader=","

" Set shortcut for CtrlPBuffer
nnoremap <Leader>b :CtrlPBuffer<Cr>

" Set ignores for CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*,*/coverage/*

" Map CtrlP-Funky
nnoremap <Leader>f :CtrlPFunky<Cr>

" Remap command history shortcut
nnoremap q: :

" Keep cursor x lines away from the top/bottom
set so=10

" Netrw: tree view
let g:netrw_liststyle = 3

" Netrw: remove the banner
let g:netrw_banner = 0

" Netww: make it narrower
let g:netrw_winsize = 25

" Highlight extra whitespace
" let g:better_whitespace_enabled=1
" let g:better_whitespace_ctermcolor='yellow'

" Strip whitespace on save
let g:strip_whitespace_on_save=1

" Strip empty lines from end of file
let g:strip_whitelines_at_eof=1

" Show spaces before or in-between tabs
let g:show_spaces_that_precede_tabs=1

" Show ruler
set ruler

" Partial search matching
set incsearch

" Make backspace to erase more
set backspace=2

" Highlight search stuff
set hlsearch

" Turn bells off
set belloff=all

" Show multiple options when tab completing commands
set wildmenu
