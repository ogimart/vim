"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ogi Martinovic
" .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" PATHOGEN
execute pathogen#infect()
call pathogen#helptags()

set nocompatible
syntax on
filetype plugin indent on 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL PLUGINS
"   ctrlp vim-airline vim-surround supertab ag
" GIT PLUGINS
"   vim-fugitive vim-gitgutter
" CLOJURE PLUGINS
"   vim-fireplace vim-clojure-static vim-clojure-highlight
" PYTHON PLUGINS
"   python-mode jedi-vim
" SQL PLUGINS
"   dbext.vim
" COLOR SCHEMES
"   hybrid
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" REMAP
"nnoremap <A-,> :bprev<CR>
"nnoremap <A-.> :bnext<CR>
"nnoremap <A-d> :bdel<CR>
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
" Mac specific
nnoremap ≤ :bprev<CR>
nnoremap ≥ :bnext<CR>
nnoremap ∂ :bdel<CR>
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

" COLOR SCHEME / FONT / SCROLLBARS
set fillchars+=vert:\ 
"hi vertsplit guifg=fg guibg=bg
set background=dark
colorscheme hybrid
set guifont=Inconsolata\ for\ Powerline:h16
set guioptions-=r
set guioptions-=L
"hi MatchParen guibg=white guifg=black
if has('gui_running')
  set transparency=5
endif

" CTRLP
set wildignore+=*/tmp/*,*.so,*.dylib,*.swp,*.zip,*.gz,*.tar,*.class,*.pyc

" AIRLINE
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='hybrid'
let g:airline#extensions#tabline#enabled=1

" GIT
let g:gitgutter_sign_column_always=1
highlight clear SignColumn

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
