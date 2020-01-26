" Based on oceanicnext
let g:jellybeans_overrides = {
\    'background': { 'guibg': '000000' },
\    'Normal': { 'guifg': 'd1d1d1' },
\    'Error': { 'guifg': 'd1d1d1' },
\    'SignColumn': { 'guibg': '000000' },
\    'DbgCurrent': {'guibg': '000000'},
\    'Statement': {'guifg': 'C594C5'},
\    'Function': {'guifg': '6699CC'},
\    'Constant': {'guifg': 'F99157'},
\    'PreProc': {'guifg': '6699CC '},
\    'Special': {'guifg': '95E6CB'},
\    'String': {'guifg': '99C794'},
\    'Smb': {'guifg': 'B3B1AD'},
\    'Identifier': {'guifg': 'EC5f67'},
\    'Label': {'guifg': 'FAC863 '},
\    'SpellBad': {'guibg': '', 'guifg': 'EA6C73'},
\    'SpellCap': {'guibg': ''},
\    'DiffAdd': {'guibg': '1c1c1c', 'guifg': '99C794 '},
\    'DiffDelete': {'guibg': '1c1c1c', 'guifg': 'EC5f67'},
\    'DiffChange': {'guibg': '1c1c1c', 'guifg': 'd1d1d1'},
\    'diffText': {'guifg': '1c1c1c', 'guibg': '95E6CB'},
\    'GitGutterAdd': {'guifg': '91B362', 'guibg': ''},
\    'GitGutterChange': {'guifg': '95E6CB', 'guibg': ''},
\    'GitGutterDelete': {'guifg': 'EA6C73', 'guibg': ''},
\    'Folded': { 'guibg': '1c1c1c', 'guifg': '685958'},
\    'Comment': { 'guifg': '685958'},
\    'CocFloating': {'guibg': '1c1c1c'},
\    'Pmenu': {'guibg': '1c1c1c', 'guifg': '888888'},
\    'PmenuSBar': {'guibg': '0f0f0f'},
\    'PmenuThumb': {'guibg': '888888'},
\    'PmenuSel': {'guifg': 'f0a0c0', 'guibg': '302028'},
\    'MsgSeparator': {'guibg': '1c1c1c'},
\    'Cursor': {'guifg': 'd1d1d1'},
\    'MatchParen': {'guifg': '', 'guibg': '4d3538' },
\    'CursorLineNr': {'guifg': 'd1d1d1'},
\    'VertSplit': {'guifg': '1c1c1c', 'guibg': '', 'attr': 'bold'},
\    'StatusLineNC': {'guibg': '1c1c1c'},
\    'StatusLine': {'guibg': '605958'}
\}

let g:jellybeans_use_term_italics = 1
let g:jellybeans_use_lowcolor_black = 1
set background=dark
color jellybeans
let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1
