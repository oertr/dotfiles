set encoding=utf-8
scriptencoding utf-8

"""""""""""""""""""" Key bind & Command
let mapleader = " "
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap jk <ESC>
nnoremap <C-J> <PageDown>
nnoremap <C-K> <PageUp>
nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l
nnoremap <Leader>q <C-W>q
nnoremap <Leader>p :Recent<SPACE>
nnoremap U <C-R>

command -nargs=1 Recent :browse filter <args> oldfiles
autocmd BufEnter * silent! lcd %:p:h

" カーソル位置を復元
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif


"""""""""""""""""""" Plugins
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'joshdick/onedark.vim'
Plug 'lambdalisue/fern.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/matchit.zip'
call plug#end()
runtime ftplugin/man.vim


"""""""""""""""""""" GLOBAL
filetype plugin indent on

set autoread
set autoindent
set backspace=indent,eol,start
set breakindent
set clipboard+=unnamedplus
set completeopt=menu,popup
set confirm
set copyindent
set expandtab
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set laststatus=0
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set mouse+=a
set nobackup
set noerrorbells visualbell t_vb=
set noswapfile
set nrformats-=octal
set number
set ruler
set scrolloff=999
set shiftwidth=2
set shortmess+=I
set shortmess-=S
set showcmd
set smartcase
set softtabstop=2
"set statusline=%M%r%t(%{&fileencoding}[%{&fileformat}])%=%p%%\ %y\ %h
set tabstop=2
set termwinscroll=5000
set undodir=~/.vim/cache/
set undofile
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yarn/*,
set wildignorecase
set wildmenu

if executable("rg")
  set grepprg=rg\ --vimgrep
endif

""""""""""""""""""" Color setting
syntax on
set termguicolors
set background=dark
colorscheme onedark

" tmux 用の設定
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"""""""""""""""""""" Plugin settings
" NERD_commenter
map cc <leader>c<space>

" ale
let g:ale_completion_enabled=1
let g:ale_python_auto_poetry=1
let g:ale_linters = {
\ 'python': ['flake8', 'pylsp'],
\}
let g:ale_fixers = {
\ 'python': ['black','isort'],
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
autocmd FileType fern set nonumber signcolumn=no

