set nocompatible
set encoding=utf-8
scriptencoding utf-8

"""""""""""""""""""" Key bind
let mapleader = " "
inoremap jk <ESC>

"""""""""""""""""""" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-jp/vimdoc-ja'
"Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'sainnhe/sonokai'
"Plug 'tomasr/molokai'
call plug#end()

"""""""""""""""""""" GLOBAL
filetype plugin indent on

"set ambiwidth=double
set autoindent
" 挿入モードでバックスペースキーを全てに働かせる
set backspace=indent,eol,start
" 折り返された行を同じインデントで表示する
set breakindent
set clipboard+=unnamedplus
set copyindent
" 変更を保存していないとき、保存確認をする
set confirm
" Tabキーを押したときにスペースを入力する
set expandtab
set fileencoding=utf-8
set undofile
set undodir=~/.vim/cache/
set fileformat=unix
set fileformats=unix,dos,mac
set hidden
" 検索パターンに一致するテキストを強調表示する
set hlsearch
" 大文字小文字を区別せず検索する
set ignorecase
" 検索パターンを打ち込んでいる最中に一致するテキストに移動する
set incsearch
" ステータス行を常に表示
set laststatus=2
" 不可視文字を表示する
set list
" 不可視文字の表示に使う文字
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" ターミナルでマウスを有効にする
set mouse+=a
set noerrorbells visualbell t_vb=
set nobackup
" スワップファイルを使用しない
set noswapfile
" 行番号を表示する
set number
" Ctrl-AやCtrl-Xで数字を増減させるとき0で始まる数を8進数として認識させない
set nrformats-=octal
" カーソルが何行目、何列目にいるかステータス行に表示する
set ruler
set shiftwidth=2
" カーソルの上または下には最低でも4行が表示される
set scrolloff=4
" 入力中のコマンドを表示する
set showcmd
" 大文字が含まれていたらignorecaseを無効にする
set smartcase
" Vim起動時のメッセージを省略
set shortmess+=I
set softtabstop=2
set tabstop=2
set wildmenu
" パターンマッチで無視するパターン
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yarn/*,


""""""""""""""""""" Color setting
syntax on
set termguicolors
set background=dark

" tmux 用の設定
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"set t_Co=256
let g:sonokai_style="atlantis"
colorscheme sonokai

"""""""""""""""""""" Plugin settings
" NERD_commenter
map cc <leader>c<space>

" ctrlp.vim
let g:ctrlp_cmd                 = 'CtrlPMixed'
let g:ctrlp_by_filename         = 1
let g:ctrlp_show_hidden         = 1
let g:ctrlp_cache_dir           = '~/.vim/cache/'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_depth           = 20
let g:ctrlp_show_hidden         = 1
let g:ctrlp_open_multiple_files = '10t'
let g:ctrlp_open_new_file       = 't'
let g:ctrlp_mruf_case_sensitive = 0

" vim-lsp
let g:lsp_signs_enabled=0
let g:lsp_diagnostics_echo_cursor=1
let g:lsp_settings_enable_suggestions=0
"Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

"""""""""""""""""""" MISC
" カレントディレクトリを開いたファイルのディレクトリに変更
autocmd BufEnter * silent! lcd %:p:h

" カーソル位置を復元
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

