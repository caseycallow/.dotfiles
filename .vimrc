set nocompatible
set encoding=utf-8 nobomb
filetype off

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'rakr/vim-one'
Plugin 'sheerun/vim-polyglot'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'ap/vim-css-color'
Plugin 'tomtom/tcomment_vim'
Plugin 'sbdchd/neoformat'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'szw/vim-maximizer'
Plugin 'ajh17/VimCompletesMe'
Plugin 'tpope/vim-fugitive'
Plugin 'machakann/vim-highlightedyank'

" all plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" map leader to space
let g:mapleader=" "

" save
nnoremap <leader>s :update<CR>
vnoremap <leader>s <Esc>:update<CR>

" jump to search
nnoremap <leader>j /

" close pane
nnoremap <leader>x :x<CR>
vnoremap <leader>x <Esc>:x<CR>

" open terminal
nnoremap <silent> <leader>t :terminal<CR>source $HOME/.bash_profile<CR>c<CR>

" push vim to bg
noremap <leader>q <C-z>

" ctrl-c to esc
inoremap <C-c> <Esc><Esc>

" Esc to jk/kj
inoremap jk <ESC>
inoremap kj <ESC>
tnoremap jk <C-W>N
tnoremap kj <C-W>N

" fzf
set rtp+=~/.fzf
nnoremap <c-t> :GFiles<CR>
nnoremap <leader>f :GFiles<CR>

" simplify moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" toggle fullscreen active window
nnoremap <silent> <Leader>m :MaximizerToggle<CR>

" vv to generate new vertical split
nnoremap <silent> vv :Sex!<CR>

" jump to current working directory
nnoremap <silent> - :e .<CR>

" change default split open direction
set splitbelow
set splitright

" remap ; to :
" hit ; twice if ; is needed
map ; :
noremap ;; ;

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
highlight Pmenu ctermbg=238 gui=bold

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

" mouse control
set mouse=a

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

" fugitive mappings
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>ga :Git add %<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>go :Git checkout

" VimCompletesMe config
autocmd FileType vim let b:vcm_tab_complete = 'vim'
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd InsertLeave * if bufname('%') != '[Command Line]' | pclose | endif
