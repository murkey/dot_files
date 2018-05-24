" plug
filetype off
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
" Plug 'nanotech/jellybeans.vim'
Plug 'crusoexia/vim-monokai'
Plug 'zhaocai/GoldenView.Vim'
Plug 'scrooloose/nerdtree'
Plug 'flowtype/vim-flow'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'isRuslan/vim-es6'
Plug 'kchmck/vim-coffee-script'
" Plug 'rakr/vim-one'
call plug#end()

" general
set title
set nowrap
set backspace=2
set splitright
set hidden

" shh
set noerrorbells
set visualbell

" tabs!
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set shiftround

" numbers!
set number
set ruler
set ls=2

" colors!!!
set background=dark
set termguicolors
syntax enable
filetype plugin indent on
set cursorline
set cursorcolumn
colorscheme monokai

" javascripts
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
let g:flow#autoclose = 1
" nmap <leader>j :FlowJumpToDef<CR>

" search
set ignorecase
set smartcase
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" leader
let mapleader = ','
let g:mapleader = ','

" disable auto-comment
autocmd FileType * setlocal formatoptions-=cro

" mouse/clipboard integration
set mouse=a
set clipboard=unnamed

" autosave
" autocmd FocusLost * wall

" fzf
let $FZF_DEFAULT_COMMAND = "ag --hidden --ignore .git --ignore flow-typed --ignore '*.meta' --ignore 'tags' -g ''"
nmap <leader>t :FZF<CR>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(input("ag: "))
nmap <leader>f :Ag<CR>
" autocmd! FileType fzf

" lightline
let g:lightline = {
  \   'colorscheme': 'wombat'
  \ }
set noshowmode

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
nmap <leader>b :NERDTreeToggle<CR>
nmap <leader>e :NERDTreeFind<CR>

" source vimrc on save
augroup auto_source_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END
