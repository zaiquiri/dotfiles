set t_Co=256
"============================
"      VUNDLE PLUGINS
"============================
set nocompatible "required by Vundle
filetype off "required by Vundle

" Add Vundle to runtime path and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'JazzCore/ctrlp-cmatcher' "must compile
Plugin 'Valloric/YouCompleteMe' "must compile
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-cucumber'
Plugin 'kana/vim-textobj-user'
Plugin 'rking/ag.vim'
" Ruby/Rails
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'skalnik/vim-vroom'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'danchoi/ri.vim'
" HTML
Plugin 'mattn/emmet-vim'
" Go
Plugin 'fatih/vim-go'

"===All plugins must be added before this====
call vundle#end()
filetype plugin indent on
"============================================

" General (self-explanatory) stuff
syntax on
set showcmd
let mapleader = "\\"
map <Leader>ra :%s/
map <C-t> <esc>:tabnew<CR>

" Easier paste from clipboard
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Folding
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Tag navigation
nmap <Leader>tn :tn<cr>
nmap <Leader>tp :tp<cr>

" Better matching for html
autocmd FileType html,eruby let b:match_words = '<\(\w\w*\):</\1,{:}'

" j and k work the same on wrapped lines
nmap j gj
nmap k gk

" autosave
autocmd BufLeave,FocusLost * silent! wall

" COLOR SCHEMES
colorscheme jellybeans
" colorscheme lucius
" LuciusLight

" Enhanced searching
set hlsearch
set incsearch
set ignorecase
set smartcase
map <leader>h :noh<cr>

" Backup directories
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Numbers
set number
set numberwidth=5
set relativenumber

" Tabs and spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Disable beeping and flashing
set noerrorbells visualbell t_vb=

" Enhanced cursor (cross-hairs)
set cursorcolumn
set cursorline

" Lots of History
set history=1000
set undolevels=1000

" < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Add symbols to words
set iskeyword+=-
autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easier split resizing
nnoremap <silent> <Leader>+ 15<C-W>>
nnoremap <silent> <Leader>- 15<C-W><
nnoremap <silent> <Leader>= <C-W>=

set splitbelow
set splitright

" White space
set list listchars=tab:»·,trail:·

" Long line highlighting
highlight OverLength ctermbg=124
match OverLength /\%81v/

" Enhanced paren matching
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

" use Silver Searcher, not grep
set grepprg=ag

" tag file search order
set tags=./tags;

" Better command line completion
set wildmenu
set wildmode=list:full

" No esc delay in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Moving lines around
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" indentation
filetype plugin indent on
nnoremap <leader>i mzgg=G`z<cr>

" good commit messages :)
autocmd Filetype gitcommit setlocal spell textwidth=72

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

" Easytags
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_always_enabled = 1

" CtrlP
" faster indexing with Silver Searcher
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .vtt
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
" faster matching with cmatch
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_clear_cache_on_exit = 0

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
"Get rid of default mode indicator
set noshowmode

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
let g:syntastic_warning_symbol = '⪼⪼'
let g:syntastic_style_warning_symbol = '≈≈'

" Vim Surround
autocmd FileType eruby let g:surround_37 = "<% \r %>"
autocmd FileType eruby let g:surround_61 = "<%= \r %>"

" UtilSnip
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Ruby autocomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" RubyBlock
runtime macros/matchit.vim
if has("autocmd")
  filetype indent plugin on
endif

" Regular arrow keys in insert mode
set nocompatible

"==================================
" Rename current buffer (from r00k)
"==================================
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>

"=================================
" Merge tab to split (from r00k)
"=================================
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction
nmap <C-M>b :call MergeTabs()<CR>
