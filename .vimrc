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
set hidden
set visualbell
set cursorline
set noerrorbells

set t_Co=256
set t_u7=
set ambw=double

" MAPPINGS
" Set Leader Key
let mapleader = " "
inoremap jk <esc>

" WORKS IN WINDOWS VIM - COPY TO CLIPBOARD
" vnoremap <leader>y "+y
" nnoremap <leader>p "+p
nnoremap <leader>w :w!<CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Tab controls
noremap <S-l> gt
noremap <S-h> gT

" Direction to change panes
" noremap <C-l> <C-w>l
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k

" Find next; display on middle screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Plugins-Begin
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()
" Plugins-End

colorscheme gruvbox
set background=dark

" nnoremap <silent> <C-p> :Files<CR>

" coc Tab trigger completion
" verbose imap <tab>
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" set updatetime=300
" set shortmess+=c
" set nobackup
" set nowritebackup

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" NERDTREE KEY BINDINGS
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" ONLY FOR VIM WSL COPY TO CLIPBOARD
" vmap <leader>y y:new ~/.vimbuf<CR>VGp:x<CR> \|:!cat ~/.vimbuf \| clip.exe<CR><CE>
" ONLY FOR VIM WSL COPY TO CLIPBOARD

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif
