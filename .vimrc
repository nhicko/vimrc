set nocompatible
filetype off
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolloff=5
set backspace=indent,eol,start
set ttyfast
set laststatus=2
set showmode
set showcmd
set number
set rnu
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase

set t_Co=256
set t_u7=
set ambw=double

" MAPPINGS
" Set Leader Key
let mapleader = " "
inoremap jk <esc>

" vnoremap <leader>y "+y
" nnoremap <leader>p "+p
nnoremap <leader>w :w!<CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Tab controls
noremap <S-l> gt
noremap <S-h> gT

" Direction to change panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Find next; display on middle screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Plugins-Begin
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" Plugins-End

" ONLY FOR VIM WSL COPY TO CLIPBOARD
vmap <leader>y y:new ~/.vimbuf<CR>VGp:x<CR> \|:!cat ~/.vimbuf \| clip.exe<CR><CE>
" ONLY FOR VIM WSL COPY TO CLIPBOARD

