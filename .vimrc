set encoding=utf-8
scriptencoding utf-8

"""""""""""""""""""" Key bind & Command
let mapleader = " "
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap jk <ESC>
nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l
nnoremap <Leader>q <C-W>q
nnoremap <Leader>p :Recent<SPACE>
nnoremap U <C-R>
nnoremap q: :q

command! -nargs=1 Recent :browse filter <args> oldfiles
autocmd BufEnter * silent! lcd %:p:h
autocmd FileType help setlocal scrolloff=999


"""""""""""""""""""" Plugins
packadd! matchit

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale', {'for': ['typescript', 'python', 'javascript', 'json', 'yaml']}
Plug 'lambdalisue/fern.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'tpope/vim-surround'
Plug 'vim-jp/vimdoc-ja'
call plug#end()


"""""""""""""""""""" GLOBAL
"filetype plugin indent on

set autoindent
set autoread
set backspace=indent,eol,start
set breakindent
set completeopt=menu,popup
set confirm
set copyindent
set expandtab
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set hidden
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set mouse=a
set nobackup
set noerrorbells visualbell t_vb=
set nostartofline
set noswapfile
set nrformats-=octal
set number
set ruler
set scrolloff=5
set shiftwidth=2
set shortmess+=I
set shortmess-=S
set showcmd
set smartcase
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set timeoutlen=500
set title
set undodir=~/.vim/cache/
set undofile
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yarn/*,
set wildignorecase
set wildmenu

if executable("rg")
  set grepprg=rg\ --vimgrep
endif

""""""""""""""""""" Color setting
"syntax on
set termguicolors
set background=dark
colorscheme onehalfdark

" tmux 用の設定
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" カーソルの形状
let &t_SI = "\e[6 q" " 挿入モードのカーソル
let &t_SR = "\e[4 q" " 置換モードのカーソル
let &t_EI = "\e[2 q" " 挿入、置換モード終了

"""""""""""""""""""" Plugin settings
" NERD_commenter
map cc <leader>c<space>

" ale
let g:ale_linters_explicit=1
let g:ale_completion_enabled=1
let g:ale_python_auto_poetry=1
let g:ale_linters = {
\ 'python': ['flake8', 'pylsp'],
\ 'json': 'all',
\ 'yaml': 'all',
\ 'typescript': 'all',
\ 'javascript': 'all'
\}
let g:ale_fixers = {
\ 'python': ['black','isort'],
\ 'typescript': ['prettier'],
\ 'javascript': ['prettier'],
\ 'json': ['prettier'],
\ 'yaml': ['prettier'],
\}
let g:ale_sign_error = '●'
let g:ale_sign_warning = '○'
nmap <Leader>f <Plug>(ale_fix)
nmap <leader>g <Plug>(ale_go_to_definition)
nmap <leader>r <Plug>(ale_rename)

" Fern
let g:fern#renderer#default#leaf_symbol = ""
let g:fern#renderer#default#collapsed_symbol = "▶"
let g:fern#renderer#default#expanded_symbol = "▼"
let g:fern#default_hidden = 1
nmap <leader>e :Fern . -drawer -toggle -reveal=% -width=20<CR>
autocmd FileType fern setlocal nonumber signcolumn=no

