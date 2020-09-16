" Package agnostic keybindings and settings

let g:python3_host_prog = '~/.config/nvim/nvim_venv/bin/python'
filetype plugin indent on
:set number
set clipboard+=unnamedplus

let mapleader = "\<Space>"
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <right> >gv
vmap < <gv
vmap > >gv
cmap w!! w !sudo tee >/dev/null %
map <leader>oo :setlocal spell! spelllang=en_us<CR>
map <leader>w :w<CR>
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

autocmd BufEnter *.html.tera :setlocal filetype=htmldjango
" * doesn't jump to next match
nnoremap * m`:keepjumps normal! *``<cr>
" substitute word and then enable repeat operator to
" replace next occurence of the word
nmap <Leader>sw *cgn
" don't replace yanked text when pasting in visual mode
vnoremap p "_dP

" Window management and terminals
set splitbelow splitright

map <Leader>tt :new term://zsh<CR>:resize 8<CR>
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
tnoremap <Esc> <C-\><C-n>
" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 
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

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function InlineCommand()
    let l:cmd = input('Command: ')
    let l:output = system(l:cmd)
    let l:output = substitute(l:output, '[\r\n]*$', '', '')
    execute 'normal i' . l:output
endfunction

nmap <silent> <leader>ic :call InlineCommand()<CR>

nnoremap <silent> <leader>ip :call SaveFile()<cr>

" paste image from clipboard as markdown link
" https://vi.stackexchange.com/a/14117/26252
function! SaveFile() abort
  let targets = filter(
        \ systemlist('xclip -selection clipboard -t TARGETS -o'),
        \ 'v:val =~# ''image''')
  if empty(targets) | return | endif

  let outdir = expand('%:p:h') . '/img'
  if !isdirectory(outdir)
    call mkdir(outdir)
  endif

  let mimetype = targets[0]
  let extension = split(mimetype, '/')[-1]
  let tmpfile = outdir . '/savefile_tmp.' . extension
  call system(printf('xclip -selection clipboard -t %s -o > %s',
        \ mimetype, tmpfile))

  let cnt = 0
  let filename = outdir . '/image' . cnt . '.' . extension
  while filereadable(filename)
    call system('diff ' . tmpfile . ' ' . filename)
    if !v:shell_error
      call delete(tmpfile)
      break
    endif

    let cnt += 1
    let filename = outdir . '/image' . cnt . '.' . extension
  endwhile

  if filereadable(tmpfile)
    call rename(tmpfile, filename)
  endif

  let @* = '![](' . fnamemodify(filename, ':.') . ')'
  normal! "*p
endfunction
