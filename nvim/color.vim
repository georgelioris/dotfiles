" Based on oceanicnext
let g:jellybeans_overrides = {
\    'Normal': { 'guifg': 'c9c8c5', 'guibg': ''},
\    'LineNr': {'guibg': ''},
\    'Visual': {'guibg': '223E55'},
\    'QuickFixLine': {'guibg': '1f384d', 'guifg': 'd4d4d4', 'attr': '' },
\    'DbgCurrent': {'guibg': '080707'},
\    'Statement': {'guifg': 'C586C0'},
\    'Function': {'guifg': 'DCDCAA'},
\    'Number': {'guifg': 'CE9178'},
\    'Identifier': {'guifg': '569CD6'},
\    'Type': {'guifg': '4EC9B0'},
\    'Constant': {'guifg': 'D16969'},
\    'Label': {'guifg': '9CDCFE'},
\    'String': {'guifg': 'CE9178'},
\    'PreProc': {'guifg': '646695'},
\    'Special': {'guifg': '9CDCFE'},
\    'Smb': {'guifg': 'B3B1AD'},
\    'htmlTag': {'guifg': '6699CC'},
\    'SpellBad': {'guibg': '', 'guifg': 'F44747'},
\    'SpellCap': {'guibg': ''},
\    'GitGutterAdd': {'guifg': '3b6732', 'guibg': '', 'attr': 'bold'},
\    'GitGutterChange': {'guifg': '324d67', 'guibg': '', 'attr': 'bold' },
\    'GitGutterDelete': {'guifg': '673232', 'guibg': '', 'attr': 'bold'},
\    'GitGutterChangeDelete': {'guifg': '67325e', 'guibg': '', 'attr': 'bold'},
\    'ErrorMsg': {'guifg': 'F44747', 'guibg': '', 'attr': ''},
\    'ALEErrorSign': {'guifg': 'F44747', 'guibg': '', 'attr': 'bold'},
\    'ALEWarningSign': {'guifg': 'D7BA7D', 'guibg': '', 'attr': 'bold'},
\    'ALEVirtualTextError': {'guifg': 'F44747', 'guibg': '', 'attr': ''},
\    'ALEVirtualTextWarning': {'guifg': 'DCDCAA', 'guibg': '', 'attr': ''},
\    'Folded': { 'guibg': '171717', 'guifg': '808080'},
\    'FoldColumn': { 'guibg': 'none'},
\    'Comment': { 'guifg': '808080'},
\    'CocFloating': {'guibg': '262424'},
\    'Pmenu': {'guibg': '262424', 'guifg': '888888'},
\    'PmenuSBar': {'guibg': '0f0f0f'},
\    'PmenuThumb': {'guibg': '888888'},
\    'PmenuSel': {'guifg': 'f0a0c0', 'guibg': '302028'},
\    'MsgSeparator': {'guibg': '262424'},
\    'Cursor': {'guifg': 'd4d4d4'},
\    'MatchParen': {'guifg': '', 'guibg': '4d3538' },
\    'CursorLineNr': {'guifg': 'd4d4d4', 'guibg': '303030'},
\    'CursorLine': {'guibg': '303030'},
\    'VertSplit': {'guifg': '303030', 'guibg': '', 'attr': 'bold'},
\    'StatusLineNc': {'guifg': '171717', 'guibg': '303030', 'attr': 'bold'},
\    'StatusLine': {'guifg': '171717', 'guibg': '808080', 'attr': 'bold'},
\    'IndentGuidesEven': {'guibg': '808080'},
\    'TabLine': { 'guifg': '808080', 'guibg': '1d1b1b'},
\    'TabLineSel': { 'guifg': '1d1b1b', 'guibg': '808080'},
\    'NERDTreeGitStatusUntracked': { 'guifg': 'EC5f67', 'guibg': ''},
\    'NERDTreeGitStatusDirDirty': { 'guifg': 'FAC863', 'guibg': ''},
\    'NERDTreeGitStatusModified': { 'guifg': '6699CC', 'guibg': ''},
\    'NERDTreeGitStatusStaged': { 'guifg': '95E6CB', 'guibg': ''},
\    'VimwikiHeader1': { 'guifg': 'FAC863', 'guibg': '', 'attr': 'bold'},
\    'VimwikiHeader2': { 'guifg': 'F99157', 'guibg': '', 'attr': 'bold'}
\}

" \    'typescriptPredefinedType': { 'guifg': 'ab7967', 'guibg': ''}

let g:jellybeans_use_term_italics = 1
let g:jellybeans_use_lowcolor_black = 1
set background=dark
color jellybeans
let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1
hi LineNr guibg=none
hi NonText guibg=none
hi VertSplit guibg=none
hi SignColumn guibg=none
hi! link MsgSeparator Pmenu
hi! link javaScriptVariable Identifier
hi! link javascriptArrowFunc javaScriptVariable
hi! link javascriptBraces Normal
hi! link javascriptParens Normal
hi! link javascriptBrackets Normal
hi! link javascriptBOMHistoryProp Normal
hi! link javascriptBOMWindowProp Special
hi! link javascriptGlobal Special
hi! link javascriptDebugger Identifier
hi! link xmlTag Identifier
hi! link xmlTagName Type
hi! link xmlAttrib Label
hi! link xmlEqual Normal
hi! link xmlTagN xmlTagName
hi! link Structure Function
hi! link Operator Identifier
hi! link htmlSpecialTagName htmlTag
hi! link tsxAttrib Label
hi! link typescriptIdentifierName Type
hi! link typescriptBraces Normal
hi! link typescriptParens Normal
hi! link typescriptBrackets Normal
hi! link typescriptOpSymbol javaScriptVariable
hi! link typescriptBOMHistoryProp Normal
hi! link typescriptBOMWindowProp Special
hi! link typescriptGlobal Identifier
hi! link typescriptCall Special
hi! link typescriptMember Identifier
hi! link typescriptTypeReference Type
hi! link typescriptFuncTypeArrow javaScriptVariable
hi! link typescriptInterfaceKeyword Identifier
hi! link typescriptInterfaceName Type
hi! link tsxCloseString Function
hi! link typescriptImport Statement
hi! link typescriptExport Statement
hi! link typescriptArrowFuncArg Special
hi! link typescriptUnion Normal
hi! link typescriptAliasKeyword Identifier
hi! link typescriptAliasDeclaration Type
hi! link typescriptFuncComma Normal
hi! link typescriptPredefinedType Type
hi! link PreProc Statement
hi! link StorageClass Special
hi! link cssImportant PreProc
hi! link cssIdentifier Identifier
hi! link cssClassName Type
hi! link NERDTreeDirSlash String
hi! link typescriptClassName Structure
" hi! link javascriptImport Statement
" hi! link javascriptExport Statement
" hi! link javascriptOpSymbol javaScriptVariable
