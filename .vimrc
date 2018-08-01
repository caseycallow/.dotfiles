set nocompatible
set encoding=utf-8 nobomb
filetype off

" --------------------------------------------------
" ------------------- PLUGINS ----------------------
" --------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin '907th/vim-auto-save'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf.vim'
Plugin 'justinmk/vim-sneak'
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
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
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
set copyindent
set cul
set diffopt=vertical
set dir=/tmp
set expandtab
set ignorecase
set incsearch
set mouse=a
set nobackup
set noshowmode
set nostartofline
set noswapfile
set nowrap
set number
set ruler
set scrolloff=3
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set title
autocmd InsertEnter,InsertLeave * set nocul!

" --------------------------------------------------
" ------------------ MAPPINGS ----------------------
" --------------------------------------------------

inoremap <C-c> <Esc><Esc>
inoremap jk <Esc>
inoremap kj <Esc>
tnoremap jk <C-W>N
tnoremap kj <C-W>N
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-I> :bp<CR>
nnoremap <C-O> :bn<CR>
nnoremap H <C-O>
nnoremap L <C-I>
nnoremap Q @q
vnoremap Q :norm @q<CR>
noremap cp yap<S-}>p
noremap ; :
noremap : ;
vmap K <Plug>SchleppUp
vmap J <Plug>SchleppDown
vmap H <Plug>SchleppLeft
vmap L <Plug>SchleppRight
imap <expr> <tab> emmet#expandAbbrIntelligent('\<tab>')

" --------------------------------------------------
" ---------------- LEADER MAPPINGS -----------------
" --------------------------------------------------

let g:mapleader=' '
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>h :Hex<CR>
vnoremap <leader>h <Esc>:Hex<CR>
nnoremap <leader>j /
nnoremap <silent> <leader>m :MaximizerToggle<CR>
nnoremap <leader>q <C-z>
nnoremap <leader>r :so ~/.vimrc<CR>
nnoremap <silent> <leader>s :update<CR>
vnoremap <silent> <leader>s <Esc>:update<CR>
nnoremap <silent> <leader>t :terminal ++rows=15<CR>source $HOME/.bash_profile<CR>c<CR>
nnoremap <leader>v :Sex!<CR>
vnoremap <leader>v <Esc>:Sex!<CR>
nnoremap <leader>x :x<CR>
vnoremap <leader>x <Esc>:x<CR>
nnoremap <leader>y V"+y
vnoremap <leader>y "+y
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>ga :Git add %<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>go :Git checkout

" --------------------------------------------------
" -------------------- COMMANDS --------------------
" --------------------------------------------------

command! WritingMode Limelight!! | :Goyo

" --------------------------------------------------
" ----------------- PLUGIN CONFIG ------------------
" --------------------------------------------------

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_extensions = ['branch', 'tabline']
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='one'

" autosave
let g:auto_save = 1
let g:auto_save_silent = 1

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

" limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry
augroup END

" sneak
let g:sneak#s_next = 1
