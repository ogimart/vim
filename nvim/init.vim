call plug#begin('~/.local/share/nvim/plugged')
" Editing
Plug 'guns/vim-sexp'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Fuzzy Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Color Scheme & Status
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim' | Plug 'itchyny/vim-gitbranch'
" Languages
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
" Terminal / REPL
Plug 'kassio/neoterm'
call plug#end()

" GENERAL
set clipboard+=unnamed
set noshowmode
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
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'subseparator': { 'left': '│', 'right': '│' },
      \ }

" PYTHON
" let g:jedi#completions_enabled=0

" PRETTY PRINT
command! PrettyPrintJSON %!python -m json.tool
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %

" COMMENTS
autocmd FileType sql setlocal commentstring=--\ %s

" LEADER MAP
let mapleader="\<space>"
let maplocalleader = "\\"
" Editing
nnoremap <leader>] o<esc>k
nnoremap <leader>[ O<esc>j
" Buffers
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
" Git vimdiff
nnoremap <leader>gb :diffget BASE<cr>
nnoremap <leader>gl :diffget LOCAL<cr>
nnoremap <leader>gr :diffget REMOTE<cr>
" Run External
nnoremap <leader>X :te pdflatex %<cr>
nnoremap <leader>D :!open -a "Marked 2" %<cr>

" COLOR SCHEME
set termguicolors
set fillchars+=vert:│
set background=dark
let g:nord_uniform_diff_background=1
colorscheme nord
