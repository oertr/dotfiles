set encoding=utf-8
scriptencoding utf-8

"""""""""""""""""""" Key bind & Command
let mapleader = " "
inoremap jk <ESC>
nnoremap U <C-R>
nnoremap <C-K> <PageUp>
nnoremap <C-J> <PageDown>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l
nnoremap <Leader>h <C-W>h
nnoremap <Leader>q <C-W>q

command -nargs=1 Recent :browse filter <args> oldfiles
autocmd BufEnter * silent! lcd %:p:h

" カーソル位置を復元
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif


"""""""""""""""""""" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-jp/vimdoc-ja'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'joshdick/onedark.vim'
Plug 'dense-analysis/ale'
call plug#end()


"""""""""""""""""""" GLOBAL
filetype plugin indent on

set autoindent
set backspace=indent,eol,start
set breakindent
set clipboard+=unnamedplus
set confirm
set completeopt=menu,popup
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
set laststatus=2
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set mouse+=a
set nobackup
set noerrorbells visualbell t_vb=
set noswapfile
set nrformats-=octal
set number
set scrolloff=999
set shiftwidth=2
set shortmess+=I
set shortmess-=S
set showcmd
set smartcase
set softtabstop=2
set statusline=%M%r%t(%{&fileencoding}[%{&fileformat}])%=%p%%\ %y\ %h
set tabstop=2
set undodir=~/.vim/cache/
set undofile
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yarn/*,
set wildignorecase
set wildmenu


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
let g:ale_linters = {
\ 'python': ['flake8', 'pylsp'],
\}
let g:ale_fixers = {
\ 'python': ['black','isort'],
\}
let g:ale_sign_error = '●'
let g:ale_sign_warning = '○'
nmap <Leader>f :ALEFix<CR>
nnoremap <F2> :ALERename<CR>

