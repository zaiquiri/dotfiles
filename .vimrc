" For Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General settings
set showcmd
set autowrite
syntax on
let mapleader = "\\"

" Numbers
set number
set numberwidth=5


set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" White space
set list listchars=tab:»·,trail:·

" Text width highlighting
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.*/

" Moving lines around
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Vroom mappings
let g:vroom_map_keys = 0
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>
map <leader>l :VroomRunLastTest <cr>

" NERDTree mappings
map <leader>f :NERDTreeFind<cr>
map <leader>F :NERDTreeFind<cr><C-l>
map <C-o> :NERDTreeToggle %<cr>

" Plugins (managed by Vundle)
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-cucumber'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-endwise'

"[vundle end]
call vundle#end()
filetype plugin indent on
