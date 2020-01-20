" Js Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'graphql': ['eslint', 'gqlint'],
\   'css': ['stylelint'],
\   'jsx': ['stylelint', 'eslint'],
\}

let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'graphql': ['prettier'],
\   'jsx': ['prettier'],
\   'json': ['prettier'],
\    'css': ['prettier', 'stylelint']
\}
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
let g:ale_linters_explicit = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warn'
let g:ale_echo_msg_format = '%s - %code%'
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 3
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_loclist_msg_format = '%severity% | %s - [%linter%] %code%'
highlight ALEErrorSign guibg=none guifg=#E1333D
highlight ALEWarningSign guibg=none guifg=#FFB454

" Use Tab for snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ functions#check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'
