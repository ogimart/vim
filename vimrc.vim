"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ogi Martinovic .vimrc
"
" Keep it as simple as possible! Keep it close to the stock Vim.
" Enforce ≈200 vimrc lines and ≈20 plugins.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

execute pathogen#infect()

" GENERAL
set nocompatible
syntax on
filetype plugin indent on
set encoding=utf-8
set autoread
set nospell
set spelllang=en
set wildignore+=*/target/*,*.jar,*.class,*.zip
set wildignore+=*/tmp/*,*.so,*.dylib,*.swp,*.gz,*.tar,*.pyc
set number
set relativenumber
set visualbell
set wildmode=list:longest
set hidden

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

" NETRW
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_altv=1

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
let g:ctrlp_map = ''
let g:ctrlp_root_markers = ['project.clj', 'pom.xml']
let g:ctrlp_extensions = ['line']
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" ROOT DIR & SYM LINKS
let g:rooter_patterns = ['project.clj', '.git/']
let g:rooter_resolve_links = 1

" CLOJURE / COMMON LISP
let g:lisp_rainbow = 0
let g:paredit_mode = 0

" PYTHON MODE
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_doc = 0
let g:pymode_lint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''

" PYTHON JEDI
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<leader>gt"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = "<leadeer>."
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:SuperTabDefaultCompletionType = "context"

" SQL
let g:dbext_default_profile = 'pg'
" let g:dbext_default_profile_name='type=PGSQL:user=:passwd=:dbname=:host='
so ~/.vim/config/dbextprofile.vim

" ASYNC RUN
augroup vimrc
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup end

" CTAGS
" OS X : brew install ctags
" :!ctags -R or $ ctags -R .

" LEADER MAP
let mapleader = "\<space>"
" Buffers
nnoremap <leader>e :Vexplore<cr>
nnoremap <leader>j :bprev<cr>
nnoremap <leader>k :bnext<cr>
nnoremap <leader>x :bprev\|bdel #<cr>
nnoremap <leader>d :bdel<cr>
" Search
nnoremap <leader>a :GrepperAg<space>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>l :CtrlPLine<cr>
" Git
nnoremap <leader>gg :Git<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<space>
nnoremap <leader>ge :Gvsplit<space>
" Async run
nnoremap <leader>R :AsyncRun<space>
