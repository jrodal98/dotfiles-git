call plug#begin('~/.config/vim/plugged')
    Plug 'metalelf0/supertab'
    Plug 'justinmk/vim-sneak'
    Plug 'svermeulen/vim-cutlass'
    Plug 'mhinz/vim-startify'
    Plug 'scrooloose/nerdtree'
    Plug 'honza/vim-snippets'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'chaoren/vim-wordmotion'
    Plug 'jiangmiao/auto-pairs'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tpope/vim-commentary'
    Plug 'Yggdroot/indentLine'
    Plug 'dense-analysis/ale'
    Plug 'Chiel92/vim-autoformat'
call plug#end()
filetype plugin indent on
:set number
set clipboard+=unnamedplus
" STARTIFY
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
           \{ 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'commands',  'header': ['   Commands']       },
           \]
let g:startify_files_number = 20
"let g:startify_change_to_vcs_root = 1
" LEADER COMMANDS
" Spell-check set to <leader>o, 'o' for 'orthography':
let mapleader = "\<Space>"
" save a file as the superuser

nnoremap <silent><Up> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><Down> :set paste<CR>m`O<Esc>``:set nopaste<CR>
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <right> >gv
cmap w!! w !sudo tee >/dev/null %
map <leader>oo :setlocal spell! spelllang=en_us<CR>
map <leader>w :w<CR>
noremap <leader><c-a> gg<s-v><s-g>
nnoremap <leader><leader> :noh<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Window management
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Configurations Part
" UI configuration
syntax on
syntax enable
" colorscheme
let base16colorspace=256
set background=dark
" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif
set number
set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
" Turn off backup
set nobackup
set noswapfile
set nowritebackup
" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4
" vim-autoformat
noremap <F3> :Autoformat<CR>

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

let g:SuperTabDefaultCompletionType = '<C-n>'

" Markdown/LaTex 
set conceallevel=0 
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
nnoremap <Plug> <Plug>Markdown_OpenUrlUnderCursor
let g:mkdp_browser = 'qutebrowser'
"" Ale
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8'],
            \ 'cpp':['ccls'],
            \ 'c': ['ccls']}
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
" Cutlass

nnoremap gm m

nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D
