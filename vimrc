let mapleader=","

" Default in nvim, but not in vim
if !has('nvim')
  set nocompatible
  set autoindent
  " set autoread ?
  set background=dark
  set backspace=indent,eol,start
  set belloff=all
  " set complete?
  " Save your swp files to a less annoying place than the current directory.
  if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
  endif
  set directory=~/.vim/swap//
  set encoding=utf-8
  set formatoptions=tcqj
  " set fillchars?
  set nofsync
  set history=10000
  set hlsearch
  set incsearch
  set laststatus=2
  set listchars="tab:> ,trail:-,nbsp:+"
  set nrformats=bin,hex
  set ruler
  set shortmess=filnxtToOF
  set showcmd
  set sidescroll=1
  set smarttab
  set tabpagemax=50
  set tags=./tags;,tags
  set ttimeoutlen=50
  set ttyfast
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//
  set viminfofile=~/.vim/viminfo
  set wildmenu
  set wildoptions=tagfile
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'embear/vim-localvimrc'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'preservim/tagbar'
Plug 'psliwka/vim-smoothie'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-syntastic/syntastic'
Plug 'vmchale/just-vim'
Plug 'xolox/vim-misc'
Plug 'yggdroot/indentline'
call plug#end()


colorscheme solarized

let g:tagbar_sort = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir=~/.vim/backup/,.
set backup        " keep a backup file

set confirm

set foldmethod=indent
set nofoldenable

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

if has('mouse')
    set mouse=a
endif

if has("autocmd")
    augroup vimrcEx
        au!
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
    augroup CursorLine
        au!
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
        au WinLeave * setlocal nocursorline
        au WinLeave * setlocal nocursorcolumn
    augroup END
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif


" My stuff
set clipboard+=unnamedplus
set cursorline
set expandtab
set gdefault
set hidden
set ignorecase
set nowrap
set number
set scrolloff=7
set shiftround
set shiftwidth=4
set showmatch
set sidescrolloff=5
set smartcase
set undofile
set virtualedit=block
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignorecase
" revisit wildmode
set wildmode=longest,list:longest

" Syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

nnoremap <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>

nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap <silent> <leader>w :set wrap!<CR>:set wrap?<CR>
nnoremap <silent> <leader>N  :set relativenumber!<CR>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>l :/\%>80v.\+<cr>

nnoremap <silent> <space> <cmd>call smoothie#downwards() <CR>

runtime macros/matchit.vim

noremap <c-j> <c-w><c-w>
noremap <c-k> <c-w><s-w>
noremap <c-l> :vertical resize -7<CR>
noremap <c-h> :vertical resize +7<CR>
nnoremap <s-h> <C-w><
nnoremap <s-l> <C-w>>

autocmd SwapExists * let v:swapchoice = "o"

let g:localvimrc_persistent = 1
