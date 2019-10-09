call plug#begin('~/.local/share/nvim/plugged')
" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people' | Plug 'guns/vim-sexp'
" Fuzzy Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Git
Plug 'tpope/vim-fugitive'
" Languages
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
" Terminal / REPL
Plug 'kassio/neoterm'
" Status & Color Scheme
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
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
let g:lightline={
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'subseparator': { 'left': '│', 'right': '│' },
      \ }

" PYTHON
let g:jedi#completions_enabled=1
let g:jedi#popup_on_dot=0
let g:jedi#goto_command="<leader>pc"
let g:jedi#goto_assignments_command="<leader>pa"
let g:jedi#goto_definitions_command="<leader>pd"
let g:jedi#documentation_command="K"
let g:jedi#usages_command="<leader>pn"
let g:jedi#completions_command="<C-Space>"
let g:jedi#rename_command="<leader>pr"

" PRETTY PRINT
command! PrettyPrintJSON %!python -m json.tool
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %

" COMMENTS
autocmd FileType sql setlocal commentstring=--\ %s

" LEADER MAP
let mapleader="\<space>"
let maplocalleader="\\"
" Editing
nnoremap <leader>] o<esc>k
nnoremap <leader>[ O<esc>j
" Buffers
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>j :bprev<cr>
nnoremap <leader>k :bnext<cr>
nnoremap <leader>x :bprev\|bdel #<cr>
" Search
nnoremap <leader>s :Rg<space>
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>l :Lines<cr>
" Clojure and ClojureScript
nnoremap <leader>cc :FireplaceConnect<cr>
nnoremap <leader>ce :Eval<cr>
nnoremap <leader>ck :%Eval<cr>
nnoremap <leader>ca :Require!<cr>
nnoremap <leader>cr :Require<cr>
nnoremap <leader>ct :.RunTests<cr>
nnoremap <leader>cn :RunTests<cr>
nnoremap <leader>cx :Require! <bar> Eval (clojure.test/run-tests)<cr>
nnoremap <leader>cl :Last<cr>
" nnoremap <leader>cp :Piggieback (figwheel.main.api/repl-env "dev")<cr>
" Git
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Git commit<space>
nnoremap <leader>go :Git checkout<space>
nnoremap <leader>gb :Git checkout -b<space>
nnoremap <leader>gp :Git push<space>
" Diff
nnoremap <leader>db :diffget BASE<cr>
nnoremap <leader>dl :diffget LOCAL<cr>
nnoremap <leader>dr :diffget REMOTE<cr>
nnoremap <leader>du :diffupdate<cr>
" Run External
nnoremap <leader>X :te pdflatex %<cr>
nnoremap <leader>D :!open -a "Marked 2" %<cr>

" COLOR SCHEME
set termguicolors
set fillchars+=vert:│
set background=dark
let g:nord_uniform_diff_background=1
colorscheme nord
