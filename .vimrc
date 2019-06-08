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
Plug 'airblade/vim-rooter'
" Code
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'SirVer/ultisnips', {'for': 'go'}
" Color Scheme
Plug 'cormacrelf/vim-colors-github'
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
set relativenumber
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
autocmd FileType go setlocal tabstop=4 shiftwidth=4
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

" COLOR SCHEME
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set fillchars+=vert:│
set background=light
silent! colorscheme github
hi SignColumn guibg=bg
hi LineNr guibg=bg
hi CursorLineNr guibg=bg
hi VertSplit guibg=bg
hi StatusLine guibg=#505050

" FUZZY SEARCH
let g:fzf_layout={'down': '~20%'}
let g:fzf_colors={ 'fg':      ['fg', 'Normal'],
                 \ 'bg':      ['bg', 'Normal'],
                 \ 'hl':      ['fg', 'Comment'],
                 \ 'fg+':     ['fg', 'Normal'],
                 \ 'bg+':     ['bg', 'Normal'] }

" STATUS LINE
set statusline=
set statusline+=\ %{fugitive#head()}\ \⁞
set statusline+=\ %f\ %m\ %r
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %{&fileformat}\ \⁞
set statusline+=\ %3p%%\ %4l:%-3c\ 

" ROOT DIR
let g:rooter_patterns=['project.clj', '.git/', 'build.gradle']
let g:rooter_resolve_links=1
let g:rooter_silent_chdir=1

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
let g:ale_completion_enabled=0
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed='normal'

" PYTHON
let g:jedi#completions_enabled=0
let g:jedi#rename_command="<leader>r"
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
nnoremap <leader>r :Rg 
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
" Async run
nnoremap <leader>R :AsyncRun<space>
nnoremap <leader>U :AsyncRun lein uberjar<cr>
nnoremap <leader>C :AsyncRun lein clean<cr>
nnoremap <leader>T :AsyncRun lein test %<cr>
nnoremap <leader>x :AsyncRun pdflatex %<cr>
nnoremap <leader>D :AsyncRun open -a "Marked 2" %<cr>
" CLJ and CLJS Figwheel
" :nmap ,r :Require! <bar> Eval (clojure.test/run-tests)<CR>
nnoremap <leader>P :Piggieback (figwheel.main.api/repl-env "dev")<cr>
