set nocompatible
set encoding=utf-8 nobomb
filetype off

" --------------------------------------------------
" ------------------- PLUGINS ----------------------
" --------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf.vim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'mattn/emmet-vim'
Plugin 'rakr/vim-one'
Plugin 'sbdchd/neoformat'
Plugin 'sheerun/vim-polyglot'
Plugin 'szw/vim-maximizer'
Plugin 'tpope/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'zirrostig/vim-schlepp'
call vundle#end()
filetype plugin indent on

" --------------------------------------------------
" -------------------- THEME -----------------------
" --------------------------------------------------

colorscheme one
set background=dark
syntax enable
hi! Normal ctermbg=NONE guibg=NONE
highlight Pmenu ctermbg=238 gui=bold

" --------------------------------------------------
" ------------------- OPTIONS ----------------------
" --------------------------------------------------

set autoindent
set autoread
set backspace=indent,eol,start
set cul
set dir=/tmp
set expandtab
set ignorecase
set incsearch
set mouse=a
set noshowmode
set nostartofline
set nowrap
set number
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set smartindent
set softtabstop=2
set splitbelow
set splitright
set swapfile
set tabstop=2
set title
autocmd InsertEnter,InsertLeave * set nocul!

" --------------------------------------------------
" ------------------ MAPPINGS ----------------------
" --------------------------------------------------

inoremap <C-c> <Esc><Esc>
inoremap jk <ESC>
inoremap kj <ESC>
tnoremap jk <C-W>N
tnoremap kj <C-W>N
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-I> :bp<cr>
nnoremap <C-O> :bn<cr>
nnoremap H <C-O>
nnoremap L <C-I>
nnoremap Q @q
vnoremap Q :norm @q<cr>
noremap cp yap<S-}>p
noremap ; :
noremap : ;

" --------------------------------------------------
" ---------------- LEADER MAPPINGS -----------------
" --------------------------------------------------

let g:mapleader=' '
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>h :Hex<cr>
vnoremap <leader>h <Esc>:Hex<cr>
nnoremap <leader>j /
nnoremap <silent> <leader>m :MaximizerToggle<cr>
nnoremap <leader>q <C-z>
nnoremap <leader>r :so ~/.vimrc<cr>
nnoremap <silent> <leader>s :update<cr>
vnoremap <silent> <leader>s <Esc>:update<cr>
nnoremap <silent> <leader>t :terminal ++rows=15<cr>source $HOME/.bash_profile<cr>c<cr>
nnoremap <leader>v :Sex!<cr>
vnoremap <leader>v <Esc>:Sex!<cr>
nnoremap <leader>x :x<cr>
vnoremap <leader>x <Esc>:x<cr>
nnoremap <leader>y V"+y
vnoremap <leader>y "+y
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gb :Gblame<cr>
nmap <Leader>ga :Git add %<cr>
nmap <Leader>gc :Gcommit<cr>
nmap <Leader>gr :Gread<cr>
nmap <Leader>go :Git checkout

" --------------------------------------------------
" ----------------- PLUGIN CONFIG ------------------
" --------------------------------------------------

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_extensions = ['branch']
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent('\<tab>')

" fzf
set rtp+=~/.fzf
let g:fzf_layout = { 'window': '10split' }

" gitgutter
set updatetime=50
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_modified_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'

" neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry
augroup END

" schlepp
vmap K <Plug>SchleppUp
vmap J <Plug>SchleppDown
vmap H <Plug>SchleppLeft
vmap L <Plug>SchleppRight
