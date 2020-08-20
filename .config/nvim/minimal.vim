" Config that should play nice with vscode's nvim extension and firenvim.
" Contains packages that don't change visual appearance or provide IDE
" experiences.

" supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

" Cutlass
nnoremap gm m
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

autocmd BufEnter *.html.tera :setlocal filetype=htmldjango
