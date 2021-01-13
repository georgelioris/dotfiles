" Js Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver'],
\   'typescriptreact': ['tsserver'],
\   'graphql': ['eslint', 'gqlint'],
\   'css': ['stylelint'],
\   'jsx': ['eslint'],
\   'reason': ['reason-language-server'],
\   'json': ['jsonlint'],
\   'svelte': ['stylelint', 'eslint'],
\   'python': ['pylint'],
\   'sh': ['shellcheck'],
\}

let g:ale_linter_aliases = {'jsx': ['javascript'], 'svelte': ['css', 'javascript'], 'tsx': ['typescript']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'graphql': ['prettier'],
\   'jsx': ['prettier'],
\   'json': ['prettier'],
\   'css': ['prettier', 'stylelint'],
\   'reason': ['refmt'],
\   'svelte': ['prettier', 'eslint'],
\   'python': ['autopep8']
\}
let g:ale_javascript_eslint_executable = 'yarn run eslint_d'
let g:ale_javascript_eslint_options = '--cache'
let g:ale_json_jsonlint_use_global = 1
let g:ale_reasonml_refmt_executable = '/home/void/.yarn/bin/bsrefmt'
let g:ale_reason_ls_executable = '/home/void/.config/coc/extensions/node_modules/coc-reason/rls/rls-linux/reason-language-server'
let g:python_autopep8_executable = 'autopep8'
let g:python_autopep8_use_global = 1
let g:ale_linters_explicit = 1
let g:ale_shell = '/bin/dash'
let g:ale_echo_msg_error_str = '🚫'
let g:ale_echo_msg_warning_str = '🔔'
let g:ale_echo_msg_format = '%s% - code%'
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 3
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '·'
let g:ale_loclist_msg_format = '%severity% %s - [%linter%]% code%'
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '■ '
let g:indentLine_char = '┆'

let g:airline#extensions#lsp#enabled = 0
let g:airline#extensions#coc#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
  " unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '│'
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = 'ℓ '
let g:airline_symbols.maxlinenr = ' ¶'
let g:airline_symbols.branch = ''
let g:airline_symbols.dirty=' 🗲'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

set foldtext=gitgutter#fold#foldtext()
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '►'
let g:gitgutter_sign_removed_first_line = '◥'
let g:gitgutter_sign_modified_removed = '│'

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
" let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" Dirty"     : 🗲",
"Clean"     : ✓",
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "✔",
    \ "Untracked" : "U",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Clean"     : "✔",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#99C794",
    \ "Modified"  : "#51C9FC",
    \ "Renamed"   : "#C594C5",
    \ "Untracked" : "#EC5f67",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#EC5f67",
    \ "Clean"     : "#dad085",
    \ "Ignored"   : "#685958"
    \ }
