set nocompatible

" PLUGINS
call plug#begin('~/.vim/plugged')
" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Fuzzy Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" External & Async Processes
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'jpalardy/vim-slime'
" Git & Projects
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
" Color Scheme
Plug 'arcticicestudio/nord-vim'
" Languages
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
call plug#end()

" GENERAL
syntax on
filetype plugin indent on
set encoding=utf-8
set autoread
set nospell
set belloff=all
set spelllang=en
set clipboard=unnamed
set signcolumn=yes
set laststatus=2
set wildmenu
set ttimeoutlen=20
set lazyredraw
set list
set listchars+=trail:·
set listchars+=tab:\ \ 
set listchars+=eol:\ 

" BACKUP
set noswapfile
set nobackup
set nowb

" TABS
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
autocmd FileType python setlocal shiftwidth=4 softtabstop=4

" INDENT
set autoindent
set copyindent
set smartindent

" NETRW
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_altv=1
autocmd FileType netrw setlocal signcolumn=no

" FUZZY SEARCH
let g:fzf_layout={'down': '~20%'}

" STATUS LINE
set statusline=
set statusline+=\ %{fugitive#head()}\ \⁞
set statusline+=\ %f\ %m\ %r
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %{&fileformat}\ \⁞
set statusline+=\ %3p%%\ %4l:%-3c\ 

" ASYNC RUN
augroup vimrc
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup end

" SLIME
let g:slime_target="tmux"
let g:slime_python_ipython=1
let g:slime_dont_ask_default=1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

" ALE
let g:ale_sign_column_always=1
let g:ale_completion_enabled=1
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed='normal'

" PYTHON
let g:jedi#completions_enabled=0
let g:jedi#rename_command="<leader>pr"
command! Flake8 :AsyncRun /usr/local/bin/flake8

" PRETTY PRINT
command! PrettyPrintJSON %!python -m json.tool
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %

" COMMENTS
autocmd FileType sql setlocal commentstring=--\ %s

" LEADER MAP
let mapleader="\<space>"
" Editing
nnoremap <leader>] o<esc>k
nnoremap <leader>[ O<esc>j
" Buffers
nnoremap <leader>e :Vexplore<cr>
nnoremap <leader>j :bprev<cr>
nnoremap <leader>k :bnext<cr>
nnoremap <leader>x :bprev\|bdel #<cr>
nnoremap <leader>d :bdel<cr>
" Search
nnoremap <leader>s :Rg 
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>l :Lines<cr>
" Git
nnoremap <leader>gg :Git<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<space>
nnoremap <leader>ge :Gvsplit<space>
" Clojure and ClojureScript Figwheel
nnoremap <leader>t :.RunTests<cr>
nnoremap <leader>r :Require! <bar> Eval (clojure.test/run-tests)<cr>
nnoremap <leader>p :Piggieback (figwheel.main.api/repl-env "dev")<cr>
" Async run
nnoremap <leader>R :AsyncRun<space>
nnoremap <leader>J :Job<space>
nnoremap <leader>U :AsyncRun lein uberjar<cr>
nnoremap <leader>C :AsyncRun lein clean<cr>
nnoremap <leader>T :AsyncRun lein test %<cr>
nnoremap <leader>x :AsyncRun pdflatex %<cr>
nnoremap <leader>D :AsyncRun open -a "Marked 2" %<cr>

" COLOR SCHEME
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set fillchars+=vert:│
set background=dark
let g:nord_uniform_diff_background = 1
colorscheme nord
hi ClojureParen guifg=fg
