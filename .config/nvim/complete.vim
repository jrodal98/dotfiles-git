" Settings that affect visual appearance or provide ide like features.
" These are settings I wouldn't expect to work inside vscode or firenvim.

let g:rainbow_active = 1
"
" STARTIFY
let g:startify_lists = [
           \ { 'type': 'files',     'header': ['   MRU']            },
           \ { 'type': 'sessions',  'header': ['   Sessions']       },
           \ { 'type': 'commands',  'header': ['   Commands']       },
           \ ]
let g:startify_files_number = 20


" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" onedark
colorscheme onedark

"
" vim-autoformat
noremap <F3> :Autoformat<CR>
let g:formatters_php = ['prettier']

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" R
" remapping the basic :: send line
nmap , <Plug>RDSendLine
" remapping selection :: send multiple lines
vmap , <Plug>RDSendSelection
let R_assign = 2

" Markdown/LaTex 
set conceallevel=0 
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
nnoremap <Plug> <Plug>Markdown_OpenUrlUnderCursor
let g:mkdp_browser = 'qutebrowser'
" allow markdown preview for html as well
let g:mkdp_command_for_global = 1
nmap <leader>mp <Plug>MarkdownPreview

"" Ale
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_rust_rls_executable = 'rust-analyzer'
let g:ale_linters = {'python': ['pylint'],
            \ 'cpp':['ccls'],
            \ 'c': ['ccls'],
            \ 'rust': ['rls']}
let g:ale_fixers = {
    \ 'rust': ['rustfmt']
    \ }
