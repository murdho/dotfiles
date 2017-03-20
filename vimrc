" --- stuff required by Vundle ---

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'tpope/vim-rails'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kopischke/vim-fetch'
Plugin 'darfink/vim-plist'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'danchoi/ri.vim'
Plugin 'skalnik/vim-vroom'
" Plugin 'chriskempson/base16-vim'
Plugin 'vim-scripts/tComment'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'shime/vim-livedown'
Plugin 'ervandew/supertab'
Plugin 'junegunn/limelight.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'mhinz/vim-startify'
Plugin 'ivalkeen/vim-simpledb'
Plugin 'wesQ3/vim-windowswap'
Plugin 'junegunn/vim-easy-align'
Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-abolish'
Plugin 'keith/swift.vim'

" Snippet stuff
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

call vundle#end()            " required
filetype plugin indent on    " required


" --- my stuff ---

" nice colors
" set background=dark
" colorscheme base16-tomorrow

" syntax highlighting
syntax on

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" for vim.rails rails commands
" set shell=sh
" set shell=zsh " overriding to get vim-simpledb work properly
set shell=$HOME/.vim/shell-wrapper.sh

" for ruler
set ruler

" for searching partial matches
set is

" allow mouse interaction
set mouse=a

" indentation
set smartindent
set autoindent
filetype indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2

" spaces instead tabs
set expandtab

" backspace erase more
set backspace=2

" strip whitespace on save
autocmd BufWritePre * StripWhitespace

" line numbers
set nu

" show 80 line column border
set colorcolumn=80

" disable word wrap
" set nowrap

" tree style to netrw
let g:netrw_liststyle=3

" splitting to right/below
set splitright
set splitbelow

" map semicolon to colon, for speed
nnoremap ; :

" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0
let g:ctrlp_reuse_window  = 'startify'

" ctrlp-funky
nnoremap <Leader>f :CtrlPFunky<Cr>
nnoremap <Leader>b :CtrlPBuffer<Cr>

" set wildignore stuff, mainly for ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*,*/coverage/*

" clipboard
set clipboard=unnamed

" disable swap files
set noswapfile

" add extra space after # in nerdcommenter
let NERDSpaceDelims=1

" insert binding.pry on the line above
map <leader>rbp Orequire "pry"; binding.pry<Esc>

" insert ap on the line above
map <leader>rap Orequire "ap"; ap

" enable lightline
set laststatus=2

" lightline settings
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': "|", 'right': "|" }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? _ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" watch for changes in ~/.vimrc and autoreload config
augroup myvimrc
    au!
    au BufWritePost .vimrc nested so $MYVIMRC
augroup END

" show relative line numbers
" set relativenumber " it's slow :(

" vim-startify
let g:startify_list_order = [
  \ ['   MRU '. getcwd()], 'dir',
  \ ['   MRU'],            'files',
  \ ['   Sessions'],       'sessions',
  \ ['   Bookmarks'],      'bookmarks',
  \ ]
let g:startify_files_number = 5

" vim-simpledb
let g:simpledb_show_timing = 0

" remove whitespace from psql result file
autocmd BufNewFile,BufRead,FileType *.txt :StripWhitespace

" disable word-wrap for txt files for better psql output (vim-simpledb)
autocmd BufNewFile,BufRead,FileType *.txt set nowrap

" transparent background
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" NERDtree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" let g:NERDTreeWinPos = "right"
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" highlight current line
" set cursorline

" Supertab / Autocomplete
inoremap <Tab> <C-P>

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Keep cursor x lines away from the top/bottom
set so=10

" limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" disable Ex mode shortcut
nnoremap Q <Nop>

" remap command history shortcut
nnoremap q: :

" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":"}
let g:slime_dont_ask_default = 1

" ===== Seeing Is Believing =====
" Annotate every line
  nmap <leader>e :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>
" Remove annotations
  nmap <leader>c :%.!seeing_is_believing --clean<CR>
" Mark the current line for annotation
  nmap <leader>m A # => <Esc>
" Mark the highlighted lines for annotation
  vmap <leader>m :norm A # => <Esc>
