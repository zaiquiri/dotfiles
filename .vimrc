" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General settings
set autowrite
syntax on
let mapleader = "\\"
set noshowmode
set showcmd
nmap j gj
nmap k gk

" autosave
autocmd BufLeave,FocusLost * silent! wall

" COLOR SCHEMES
  colorscheme jellybeans
" colorscheme Sunburst
" colorscheme molokai
" colorscheme strange
" colorscheme jellyx

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
map <leader>x :noh<cr>

" Backup directories
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

" Disable beeping and flashing
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Enhanced cursor
set cursorcolumn
set cursorline

" History
set history=1000
set undolevels=1000

" Dashes are part of words
set iskeyword+=-

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resize splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

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
filetype plugin indent on
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
nmap ; :CtrlPBuffer<CR>

" DelimitMate
set backspace=indent,eol,start
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1

" Airline
let g:airline_theme="jellybeans"
set laststatus=2
let g:airline_detect_modified=1
let g:airline_inactive_collapse=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '|'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = '※'

let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#show_tab_nr = 1

let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#whitespace#enabled = 1

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'c' : 'C',
      \ 'v' : 'V',
      \ 'V' : 'V',
      \ 's' : 'S',
      \ 'S' : 'S',
      \}

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

let g:syntastic_error_symbol = '⚑⚑'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '⧲⪼'
let g:syntastic_style_warning_symbol = '≈≈'

" Ruby autocomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Plugins (managed by Vundle)
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()
filetype plugin indent on
