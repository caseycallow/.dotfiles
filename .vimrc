set nocompatible
set encoding=utf-8 nobomb
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" one dark theme
Plugin 'rakr/vim-one'

" languages syntax
Plugin 'sheerun/vim-polyglot'

" auto pairs
Plugin 'jiangmiao/auto-pairs'

" tab line
Plugin 'itchyny/lightline.vim'

" git branch
Plugin 'itchyny/vim-gitbranch'

" emmet
Plugin 'mattn/emmet-vim'

" css color
Plugin 'ap/vim-css-color'

" comment toggle
Plugin 'tomtom/tcomment_vim'

" prettier
Plugin 'prettier/vim-prettier'

" fuzzy find
Plugin 'junegunn/fzf.vim'

" set path for fzf
set rtp+=/usr/local/opt/fzf

" all plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" remap Esc to jk/kj
inoremap jk <ESC>
inoremap kj <ESC>

" enable ruler and line numbers
set ruler
set number

" color scheme
colorscheme one
set background=dark
syntax enable
hi! Normal ctermbg=NONE guibg=NONE

" soft tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" store temporary files in separate folder
set swapfile
set dir=~/tmp

" ignore case of searches
set ignorecase

" highlight dynamically as pattern is typed
set incsearch

" show the filename in the window titlebar
set title

" don’t reset cursor to start of line when moving around
set nostartofline

" show the (partial) command as it’s being typed
set showcmd

" prevent line wrapping
set nowrap

" don’t reset cursor to start of line when moving around
set nostartofline

" don’t add empty newlines at the end of files
set noeol

" start scrolling three lines before the horizontal window border
set scrolloff=3

" disable cursorline in insert mode
set cul
autocmd InsertEnter,InsertLeave * set nocul!

" open {} and () when enter pressed
set autoindent
set smartindent

" nicer netrw
let g:netrw_banner=0
let g:netrw_liststyle=4
let g:netrw_list_hide='.*\.swp$,\~$,\.orig$'

" remap ctrl-c to esc
inoremap <C-c> <Esc><Esc>

" strip trailing spaces
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" lightline config
set laststatus=2
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ }
  \ }

" emmet config
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" prettier config
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
let g:prettier#config#parse = 'babylon'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'true'
let g:prettier#config#trailing_comma = 'false'

autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
