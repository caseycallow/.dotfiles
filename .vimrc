set nocompatible
set encoding=utf-8 nobomb
filetype off

" --------------------------------------------------
" ------------------- PLUGINS ----------------------
" --------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'machakann/vim-highlightedyank'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'prettier/vim-prettier'
Plugin 'rakr/vim-one'
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
hi Normal ctermbg=NONE
hi CursorLineNr ctermbg=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSel ctermfg=NONE ctermbg=20 cterm=NONE
hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuThumb ctermfg=NONE ctermbg=20 cterm=NONE
hi link Sneak Normal

" --------------------------------------------------
" ------------------- OPTIONS ----------------------
" --------------------------------------------------

set autoindent
set autoread
set backspace=indent,eol,start
set copyindent
set diffopt=vertical
set expandtab
set gdefault
set ignorecase
set incsearch
set lazyredraw
set mouse=a
set nobackup
set nocursorcolumn
set nocursorline
set nohlsearch
set noshowmode
set nostartofline
set noswapfile
set nowrap
set number relativenumber
set regexpengine=1
set ruler
set scrolloff=999
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
set synmaxcol=200
set tabstop=2
set title
set ttyfast

" --------------------------------------------------
" ------------------ MAPPINGS ----------------------
" --------------------------------------------------

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
nnoremap cp yap<S-}>p
nnoremap cl Yp
nnoremap ya mzggVG"+y`z
noremap ; :
noremap : ;
noremap B ^
noremap E $
nnoremap j gj
nnoremap k gk
noremap > >>
noremap < <<
vmap K <Plug>SchleppUp
vmap J <Plug>SchleppDown
vmap H <Plug>SchleppLeft
vmap L <Plug>SchleppRight
imap <expr> <tab> emmet#expandAbbrIntelligent('\<tab>')
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" --------------------------------------------------
" ---------------- LEADER MAPPINGS -----------------
" --------------------------------------------------

let g:mapleader=' '
nnoremap <leader>a :Ack 
nnoremap <leader>b :Switch<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :Hex<CR>
vnoremap <leader>h <Esc>:Hex<CR>
nnoremap <leader>j /
nnoremap <silent> <leader>m :MaximizerToggle<CR>
nnoremap <leader>q <C-z>
nnoremap <leader>r :so $MYVIMRC<CR>
nnoremap <silent> <leader>s :update<CR>
vnoremap <silent> <leader>s <Esc>:update<CR>
nnoremap <silent> <leader>t :vertical terminal<CR>source $HOME/.bash_profile<CR>c<CR>
nnoremap <leader>v :Sex!<CR>
vnoremap <leader>v <Esc>:Sex!<CR>
nnoremap <leader>x :x<CR>
vnoremap <leader>x <Esc>:x<CR>
nnoremap <leader>y V"+y
vnoremap <leader>y "+y
nnoremap <Leader>cl yiwoconsole.log("<c-r>"", <c-r>");<Esc>^
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>ga :Git add %<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>go :Git checkout
nnoremap <leader>wm :call ToggleWritingMode()<CR>

" --------------------------------------------------
" ------------------- FUNCTIONS --------------------
" --------------------------------------------------

let g:writingmode = 1
function! ToggleWritingMode()
  if g:writingmode
    Limelight
    Goyo
    set wrap linebreak spell
    let g:writingmode = 0
  else
    Limelight!
    Goyo!
    set nowrap nolinebreak nospell
    let g:writingmode = 1
  endif
endfunction

" --------------------------------------------------
" ----------------- PLUGIN CONFIG ------------------
" --------------------------------------------------

" ack
let g:ackhighlight = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_extensions = ['branch', 'tabline']
let g:airline_highlighting_cache = 1
let g:airline_theme = 'one'
let g:airline_section_b = '%{strftime("%I:%M\%p")}'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" fzf
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND= 'git ls-files --exclude-standard --others --cached'
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

" prettier
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#config#parser = 'babylon'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.json,*.md PrettierAsync

" sneak
let g:sneak#s_next = 1
