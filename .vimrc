set nocompatible
set encoding=utf-8 nobomb
filetype off

" --------------------------------------------------
" ------------------- PLUGINS ----------------------
" --------------------------------------------------

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'rakr/vim-one'
Plugin 'sheerun/vim-polyglot'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sbdchd/neoformat'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'szw/vim-maximizer'
Plugin 'machakann/vim-highlightedyank'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'zirrostig/vim-schlepp'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

" --------------------------------------------------
" ------------------- ALIASES ----------------------
" --------------------------------------------------

" ctrl-c to esc
inoremap <C-c> <Esc><Esc>

" Esc to jk/kj
inoremap jk <ESC>
inoremap kj <ESC>
tnoremap jk <C-W>N
tnoremap kj <C-W>N

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

" clone paragraph
noremap cp yap<S-}>p

" remap ; to :
map ; :
noremap ;; ;

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
" ----------------- LEADER MAPS --------------------
" --------------------------------------------------

" map leader to space
let g:mapleader=' '

" save
nnoremap <silent> <leader>s :update<cr>
vnoremap <silent> <leader>s <Esc>:update<cr>

" fzf
nnoremap <leader>f :GFiles<cr>

" reload vim
nnoremap <leader>r :so ~/.vimrc<cr>

" jump to search
nnoremap <leader>j /

" vertical split
nnoremap <leader>v :Sex!<cr>
vnoremap <leader>v <Esc>:Sex!<cr>

" horizontal split
nnoremap <leader>h :Hex<cr>
vnoremap <leader>h <Esc>:Hex<cr>

" close pane
nnoremap <leader>x :x<cr>
vnoremap <leader>x <Esc>:x<cr>

" push vim to bg
noremap <leader>q <C-z>

" open terminal
nnoremap <silent> <leader>t :terminal ++rows=15<cr>source $HOME/.bash_profile<cr>c<cr>

" yank to system clipboard
nnoremap <leader>y V"+y
vnoremap <leader>y "+y

" fugitive
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

" Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry
augroup END

" git gutter
set updatetime=50
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_modified_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='powerlineish'

" schlepp
vmap K <Plug>SchleppUp
vmap J <Plug>SchleppDown
vmap H <Plug>SchleppLeft
vmap L <Plug>SchleppRight

" emmet
imap <expr> <tab>emmet#expandAbbrIntelligent('\<tab>')

" fzf
set rtp+=~/.fzf
let g:fzf_layout = { 'window': '10split' }
