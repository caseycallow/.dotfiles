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

" neoformat
Plugin 'sbdchd/neoformat'

" fuzzy find
Plugin 'junegunn/fzf.vim'

" git gutter
Plugin 'airblade/vim-gitgutter'

" vim tmux navigator
Plugin 'christoomey/vim-tmux-navigator'

" all plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" set path for fzf
set rtp+=~/.fzf

" remap fzf to always use GitFiles when searching
nnoremap <c-t> :GFiles<cr>

" remap Esc to jk/kj
inoremap jk <ESC>
inoremap kj <ESC>

" simplify moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" change default split open direction
set splitbelow
set splitright

" enable ruler and line numbers
set ruler
set number

" refresh changed content of opened file when cursor stops moving
set autoread

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
set dir=/tmp

" ignore case of searches
set ignorecase

" highlight dynamically as pattern is typed
set incsearch

" show the filename in the window titlebar
set title

" show the (partial) command as it’s being typed
set showcmd

" prevent line wrapping
set nowrap

" don’t reset cursor to start of line when moving around
set nostartofline

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

" remap zz to save
nnoremap zz :update<CR>
inoremap zz <Esc>:update<CR>
vnoremap zz <Esc>:update<CR>

" lightline config
set laststatus=2
set noshowmode
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

" Neoformat config
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" git gutter config
set updatetime=100
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_modified_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'
