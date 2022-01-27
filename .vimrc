set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set balloonevalterm
set breakindent
set completeopt=menu,popup
set confirm
set copyindent
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set hlsearch
set ignorecase
set incsearch
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
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
set shortmess-=S
set showcmd
set signcolumn=yes
set smartcase
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set termguicolors
set timeoutlen=500
set title
set ttymouse=sgr
set undodir=~/.vim/cache/
set undofile
set updatetime=400
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yarn/*,
set wildignorecase
set wildmenu

if executable("rg")
  set grepprg=rg\ --vimgrep
endif

"""""""""""""""""""" Command & Key bind
command! -nargs=1 Recent :browse filter <args> oldfiles
autocmd BufEnter * silent! lcd %:p:h
autocmd FileType help setlocal scrolloff=999

let mapleader=" "
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap jk <ESC>
nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l
nnoremap <Leader>q <C-W>c
nnoremap <Leader>p :Recent<SPACE>
nnoremap U <C-R>

"""""""""""""""""""" Plugins
" disable any standard plugin
let g:loaded_2html_plugin=1
let g:loaded_getscriptPlugin=1
let g:loaded_gzip=1
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
let g:loaded_tar=1
let g:loaded_tarPlugin=1
let g:loaded_vimball=1
let g:loaded_vimballPlugin=1
let g:loaded_zip=1
let g:loaded_zipPlugin=1

" install plugin
packadd! matchit

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale', {'for': ['typescript', 'python', 'javascript', 'json', 'yaml']}
Plug 'gruvbox-community/gruvbox'
Plug 'lambdalisue/fern.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-jp/vimdoc-ja'
call plug#end()

" colorscheme
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_sign_column="bg0"
let g:gruvbox_vert_split="bg3"
colorscheme gruvbox

" vim-commentary
autocmd FileType * let b:commentary_startofline=1

" ale
let g:ale_linters_explicit=1
let g:ale_completion_enabled=1
let g:ale_python_auto_poetry=1
let g:ale_linters={
\ 'python': ['flake8', 'pylsp'],
\ 'json': 'all',
\ 'yaml': 'all',
\ 'typescript': 'all',
\ 'javascript': 'all'
\}
let g:ale_fixers={
\ 'python': ['black','isort'],
\ 'typescript': ['prettier'],
\ 'javascript': ['prettier'],
\ 'json': ['prettier'],
\ 'yaml': ['prettier'],
\}
let g:ale_sign_error='●'
let g:ale_sign_warning='○'
let g:ale_set_balloons=1
nmap <Leader>f <Plug>(ale_fix)
nmap <leader>g <Plug>(ale_go_to_definition)
nmap <leader>r <Plug>(ale_rename)

" Fern
let g:fern#renderer#default#leaf_symbol=""
let g:fern#renderer#default#collapsed_symbol="▶"
let g:fern#renderer#default#expanded_symbol="▼"
let g:fern#default_hidden=1
nmap <Leader>e :Fern . -drawer -toggle -reveal=% -width=20<CR>
autocmd FileType fern setlocal nonumber signcolumn=no

""""""""""""""""""" Other
" for tmux
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

" cursor shape
let &t_SI="\e[6 q" " insert mode
let &t_SR="\e[4 q" " replace mode
let &t_EI="\e[2 q" " end insert of replace mode

