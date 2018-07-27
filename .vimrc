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
Plugin 'itchyny/vim-gitbranch'
Plugin 'ap/vim-css-color'
Plugin 'tomtom/tcomment_vim'
Plugin 'sbdchd/neoformat'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'szw/vim-maximizer'
Plugin 'tpope/vim-fugitive'
Plugin 'machakann/vim-highlightedyank'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'zirrostig/vim-schlepp'

" all plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" map leader to space
let g:mapleader=" "

" reload .vimrc
nnoremap <leader>r :so ~/.vimrc<cr>

" save
nnoremap <silent> <leader>s :update<cr>
vnoremap <silent> <leader>s <Esc>:update<cr>

" jump to search
nnoremap <leader>j /

" close pane
nnoremap <leader>x :x<cr>
vnoremap <leader>x <Esc>:x<cr>

" new vertical split
nnoremap <leader>v :Sex!<cr>
vnoremap <leader>v <Esc>:Sex!<cr>

" new horizontal split
nnoremap <leader>h :Hex<cr>
vnoremap <leader>h <Esc>:Hex<cr>

" open terminal
nnoremap <silent> <leader>t :terminal ++rows=15<cr>source $HOME/.bash_profile<cr>c<cr>

" yank to clipboard
nnoremap <leader>y V"+y
vnoremap <leader>y "+y

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
nnoremap <leader>f :GFiles<cr>
let g:fzf_layout = { 'window': '10split' }

" simplify moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" buffer navigation
nnoremap <C-I> :bp<cr>
nnoremap <C-O> :bn<cr>

" time travel through recent positions
nnoremap H <C-O>
nnoremap L <C-I>

" toggle fullscreen active window
nnoremap <silent> <Leader>m :MaximizerToggle<cr>

" macros to Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" change default split open direction
set splitbelow
set splitright

" remap ; to :
" hit ; twice if ; is needed
map ; :
noremap ;; ;

" enable backspace to work as expected
set backspace=indent,eol,start

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

" clone paragraph
noremap cp yap<S-}>p

" Neoformat config
augroup fmt
  autocmd!
  autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry
augroup END

" git gutter config
set updatetime=100
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_modified_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'

" fugitive mappings
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gb :Gblame<cr>
nmap <Leader>ga :Git add %<cr>
nmap <Leader>gc :Gcommit<cr>
nmap <Leader>gr :Gread<cr>
nmap <Leader>go :Git checkout

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme="powerlineish"

" schlepp config
vmap <unique> K <Plug>SchleppUp
vmap <unique> J <Plug>SchleppDown
vmap <unique> H <Plug>SchleppLeft
vmap <unique> L <Plug>SchleppRight
