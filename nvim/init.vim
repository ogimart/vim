call plug#begin('~/.local/share/nvim/plugged')
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
" Tags
Plug 'ludovicchabant/vim-gutentags'
" Color Scheme
Plug 'arcticicestudio/nord-vim'
" Status
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
" Languages
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
call plug#end()

" NEOVIM
let g:python3_host_prog=expand('~/.pyenv/versions/nvim3/bin/python')
let g:python_host_prog=expand('~/.pyenv/versions/nvim2/bin/python')

" GENERAL
set clipboard+=unnamed
set signcolumn=yes
set noshowmode

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
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

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
" Clojure and ClojureScript Figwheel
nnoremap <leader>t :.RunTests<cr>
nnoremap <leader>r :Require! <bar> Eval (clojure.test/run-tests)<cr>
nnoremap <leader>p :Piggieback (figwheel.main.api/repl-env "dev")<cr>
" Async run
nnoremap <leader>R :AsyncRun<space>
nnoremap <leader>J :Job<space>
nnoremap <leader>X :AsyncRun pdflatex %<cr>
nnoremap <leader>D :AsyncRun open -a "Marked 2" %<cr>

" COLOR SCHEME
set termguicolors
set fillchars+=vert:│
set background=dark
let g:nord_uniform_diff_background = 1
colorscheme nord
