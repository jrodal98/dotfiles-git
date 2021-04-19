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
