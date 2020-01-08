call plug#begin('~/.local/share/nvim/plugged')
" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
" Fuzzy Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
" LSP Client
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Languages
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'kovisoft/slimv', {'for': 'lisp'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'justmao945/vim-clang', {'for': 'c'}
" Dispatch / REPL
Plug 'tpope/vim-dispatch'
Plug 'jpalardy/vim-slime'
" Status & Color Scheme
Plug 'itchyny/lightline.vim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

" GENERAL
set clipboard+=unnamed
set noshowmode
set signcolumn=yes
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
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2

" GIT
" let g:git_messenger_no_default_mappings=v:true

" REPL
" let g:slime_target = "neovim"
let g:slime_target="tmux"
let g:slime_default_config={"socket_name": "default", "target_pane": "{bottom-left}"}
let g:slime_python_ipython=1

" DEOPLETE
let g:deoplete#enable_at_startup=1

" LSP
let g:LanguageClient_serverCommands = {
      \ 'python': ['pyls'],
      \ 'java': ['/usr/local/bin/jdtls', '-data', getcwd()],
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

" COMMON LISP
let g:paredit_mode=0
let g:slimv_impl='sbcl'
let g:slimv_preferred='sbcl'
let g:slimv_disable_clojure=1
let g:slimv_disable_scheme=1

" PROLOG
autocmd BufRead,BufNewFile *.pl set filetype=prolog

" C
let g:clang_c_options='-std=c11'
autocmd BufRead,BufNewFile *.h,*.c set filetype=c

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
nnoremap <leader>wq :wq<cr>
nnoremap <leader>h :noh<cr>
nnoremap <leader>j :bprev<cr>
nnoremap <leader>k :bnext<cr>
nnoremap <leader>x :bprev\|bdel #<cr>
nnoremap <leader>n :echom expand('%')<cr>
nnoremap <leader>m :echom expand('%:p')<cr>
" Search
nnoremap <leader>r :Rg <c-r>=expand("<cword>")<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>s :Lines<cr>
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
nnoremap <leader>gg :Gvdiff master
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
nnoremap <leader>X :Dispatch pdflatex %<cr>
nnoremap <leader>D :Dispatch open -a "Marked 2" %<cr>
" Language Server CLient
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<cr>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<cr>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<cr>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<cr>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<cr>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<cr>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<cr>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<cr>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<cr>
nnoremap <leader>lm :call LanguageClient_contextMenu()<cr>

" STATUS LINE
let g:lightline={
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'subseparator': { 'left': '│', 'right': '│' },
      \ }

" COLOR SCHEME
set termguicolors
set fillchars+=vert:│
if $SCHEME == 'dark'
  set background=dark
  let g:gruvbox_contrast_dark='hard'
  let g:gruvbox_invert_selection=0
  let g:gruvbox_sign_column='bg0'
  let g:lightline.colorscheme='gruvbox'
  colorscheme gruvbox
  hi DiffAdd gui=none guibg=#3c3836
  hi DiffDelete gui=none guibg=#3c3836
  hi DiffChange gui=none guibg=#3c3836
  hi Pmenu guibg=#3c3836
  hi Visual guibg=#3c3836
else
  set background=light
  let g:gruvbox_contrast_light='hard'
  let g:gruvbox_invert_selection=0
  let g:gruvbox_sign_column='bg0'
  let g:lightline.colorscheme='gruvbox'
  colorscheme gruvbox
  hi DiffAdd gui=none guibg=#ebdbb2
  hi DiffDelete gui=none guibg=#ebdbb2
  hi DiffChange gui=none guibg=#ebdbb2
  hi Pmenu guibg=#ebdbb2
endif
let g:fzf_colors={}
