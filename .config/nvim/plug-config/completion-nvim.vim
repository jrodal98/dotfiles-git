" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_enable_snippet = 'UltiSnips'
