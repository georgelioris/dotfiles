" Js Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'graphql': ['eslint', 'gqlint'],
\   'css': ['stylelint'],
\   'jsx': ['eslint'],
\   'reason': ['reason-language-server'],
\   'json': ['jsonlint'],
\}

let g:ale_linter_aliases = {'jsx': ['javascript']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'graphql': ['prettier'],
\   'jsx': ['prettier'],
\   'json': ['prettier'],
\    'css': ['prettier', 'stylelint'],
\   'reason': ['refmt']
\}
let g:ale_reasonml_refmt_executable = '/home/void/.yarn/bin/bsrefmt'
let g:ale_reason_ls_executable = '/home/void/.config/coc/extensions/node_modules/coc-reason/rls/rls-linux/reason-language-server'
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

" NERDTreeConfiguration
let g:WebDevIconsUnicodeDecorateFolderNodes = 1  "enables nodes icons
let g:DevIconsEnableFoldersOpenClose = 1 "enables different icon for expandable/not expandable icons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:NERDTreeDirArrowExpandable = nr2char(8200)  "sets expandable character to none - hides it
let g:NERDTreeDirArrowCollapsible = nr2char(8200)  "sets collapsible character to none - hides it
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1


let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "⋆",
    \ "Staged"    : "•",
    \ "Untracked" : "∘",
    \ "Dirty"     : "⁖",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#99C794",
    \ "Modified"  : "#51C9FC",
    \ "Renamed"   : "#C594C5",
    \ "Untracked" : "#EC5f67",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#F99157",
    \ "Clean"     : "#dad085",
    \ "Ignored"   : "#685958"
    \ }
