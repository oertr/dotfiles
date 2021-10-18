set nocompatible
set encoding=utf-8
scriptencoding utf-8

"""""""""""""""""""" Key bind & Command
let mapleader = " "
inoremap jk <ESC>
nnoremap U <C-R>
nnoremap <C-J> <C-F>
nnoremap <C-K> <C-B>
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
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'onedark'
call plug#end()


"""""""""""""""""""" GLOBAL
filetype plugin indent on

set autoindent
set backspace=indent,eol,start
set breakindent
set clipboard+=unnamedplus
set copyindent
set confirm
set expandtab
set fileencoding=utf-8
set undofile
set undodir=~/.vim/cache/
set fileformat=unix
set fileformats=unix,dos,mac
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set mouse+=a
set noerrorbells visualbell t_vb=
set nobackup
set noswapfile
set number
set nrformats-=octal
set shiftwidth=2
set scrolloff=999
set statusline=%M%r%t(%{&fileencoding}[%{&fileformat}])%=%p%%\ %y\ %h
set showcmd
set smartcase
set shortmess+=I
set softtabstop=2
set tabstop=2
set wildmenu
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yarn/*,


""""""""""""""""""" Color setting
syntax on
set termguicolors
set background=dark

" tmux 用の設定
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"set t_Co=256
colorscheme onedark


"""""""""""""""""""" Plugin settings
" NERD_commenter
map cc <leader>c<space>

" vim-lsp
let g:lsp_signs_enabled=0
let g:lsp_diagnostics_echo_cursor=1
let g:lsp_settings_enable_suggestions=0

"Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
