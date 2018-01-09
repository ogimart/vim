" PLUGINS
call plug#begin('~/.vim/plugged')
" Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" External Async Processes & tmux
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'jpalardy/vim-slime'
" Git & Projects
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'
" Clojure
Plug 'tpope/vim-fireplace'
" Python
Plug 'davidhalter/jedi-vim'
Plug 'cjrh/vim-conda'
" SQL
Plug 'vim-scripts/dbext.vim'
" Airline & Color Schemes
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
call plug#end()

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
" set visualbell
set wildmode=list:longest
set hidden
set ttimeoutlen=20
set clipboard=unnamed

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

" COLOR SCHEME
set fillchars+=vert:\ 
hi vertsplit guifg=fg guibg=bg
set background=dark
colorscheme zenburn
let g:airline_theme='hybridline'
autocmd InsertEnter,InsertLeave * set cul!
highlight clear SignColumn

" AIRLINE
set laststatus=2
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1

" ROOT DIR
let g:rooter_patterns = ['project.clj', '.git/']
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1

" FZF & Search
let g:fzf_layout = { 'down': '~20%' }
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
let g:ale_set_highlights = 0

" CLOJURE
let g:lisp_rainbow = 0
let g:paredit_mode = 0
hi MatchParen cterm=bold ctermbg=none ctermfg=white

" PYTHON
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
let g:conda_startup_msg_suppress = 1

" SLIME
let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": split($TMUX, ",")[1], "target_pane": ":.1"}
let g:slime_python_ipython = 1

" SQL
let g:dbext_default_profile = 'pg'
" let g:dbext_default_profile_name='type=PGSQL:user=:passwd=:dbname=:host='
so ~/.vim/config/dbextprofile.vim

" ASYNC RUN
augroup vimrc
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup end

" LEADER MAP
let mapleader = "\<space>"
" Buffers
nnoremap <leader>e :Vexplore<cr>
nnoremap <leader>j :bprev<cr>
nnoremap <leader>k :bnext<cr>
nnoremap <leader>x :bprev\|bdel #<cr>
nnoremap <leader>d :bdel<cr>
" Search
nnoremap <leader>a :Ag<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>b :Buffers<cr>
" Git
nnoremap <leader>m :Magit<cr>
nnoremap <leader>gg :Git<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<space>
nnoremap <leader>ge :Gvsplit<space>
" Async run
nnoremap <leader>R :AsyncRun<space>
