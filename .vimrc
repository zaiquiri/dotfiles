" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General settings
set showcmd
set autowrite
syntax on
let mapleader = "\\"
colorscheme jellybeans
set cursorline
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Numbers
set number
set numberwidth=5

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Dashes are part of words
set iskeyword+=-

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" White space
set list listchars=tab:»·,trail:·

" Long line highlighting
highlight OverLength ctermfg=131
match OverLength /\%81v.*/

" Moving lines around
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" indentation
nnoremap <c-i> mzgg=G`z<cr>

" Vroom
let g:vroom_map_keys = 0
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>
map <leader>l :VroomRunLastTest <cr>

" NERDTree
map <leader>f :NERDTreeFind<cr>
map <leader>F :NERDTreeFind<cr><C-l>
map <leader>[ :NERDTreeToggle %<cr>

" Tagbar
let g:tagbar_autoclose = 1
nmap <leader>] :TagbarToggle<cr>

" CtrlP
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Airline
" set laststatus=2
let g:airline_theme="jellybeans"

" Syntastic
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>se :Errors<cr>
nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>

let g:syntastic_enable_signs=1
let g:syntastic_html_jshint_conf = "$HOME/.jshintrc"
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'

" Plugins (managed by Vundle)
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mileszs/ack.vim'

call vundle#end()
filetype plugin indent on
