"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ogi Martinovic
" .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN MANAGER
"   pathogen
" GENERAL PLUGINS
"   ctrlp vim-surround supertab ack
" GIT PLUGINS
"   vim-fugitive vim-gitgutter
" COMMON LISP PLUGINS
"   slimv
" CLOJURE PLUGINS
"   vim-fireplace vim-clojure-static vim-clojure-highlight
" PYTHON PLUGINS
"   python-mode jedi-vim
" SQL PLUGINS
"   dbext.vim
" COLOR SCHEMES
"   hybrid vim-airline vim-airline-themes
" NOT INSTALLED (TO DO)
"   ale pipe.vim vim-dispatch latex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" PATHOGEN
execute pathogen#infect()
call pathogen#helptags()

set nocompatible
syntax on
filetype plugin indent on

" GENERAL
set encoding=utf-8
set autoread
set nospell
set spelllang=en
set wildignore+=*/target/*,*.jar,*.class,*.zip
set number
set relativenumber
set visualbell
set wildmode=list:longest

" NO BACKUP
set noswapfile
set nobackup
set nowb

" TABS
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" INDENT
set autoindent
set copyindent
set smartindent

" COLOR SCHEME / FONT / SCROLLBARS
set fillchars+=vert:\ 
"hi vertsplit guifg=fg guibg=bg
set background=dark
colorscheme hybrid
set guifont=Source\ Code\ Pro:h14
set guioptions-=r
set guioptions-=L
" Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='hybridline'
if has('gui_running')
  let g:airline_theme='hybrid'
  set transparency=0
endif

" CTRLP & AG Searcher
set wildignore+=*/tmp/*,*.so,*.dylib,*.swp,*.zip,*.gz,*.tar,*.class,*.pyc
let g:ctrlp_extensions = ['line']
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" GIT
let g:gitgutter_enabled = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

" CLOJURE / COMMON LISP
let g:lisp_rainbow = 0
let g:paredit_mode = 0

" PYTHON MODE
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checkers = ["pep8", "pyflakes"]
let g:pymode_lint_write = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0
let g:pymode_virtualenv = 1

" PYTHON JEDI
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "1"
let g:SuperTabDefaultCompletionType = "context"

" SQL
let g:dbext_default_profile = 'pg'
so ~/.vim/config/dbextprofile.vim

" CTAGS
" OS X : brew install ctags
" :!ctags -R or $ ctags -R .

" KEY MAP
let mapleader = "\<Space>"
nnoremap <Leader>e :Explore<CR>
" Buffers
noremap <Leader>j :bprev<CR>
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>x :bdel<CR>
nnoremap <Leader>a :Ack!<Space>
" Search
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>l :CtrlPLine<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
" Git
nnoremap <Leader>s :Gstatus<CR>
nnoremap <Leader>d :Gdiff<CR>
