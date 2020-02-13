function! functions#check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Show documentation in preview window function
function! functions#show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Link hl-groups
function! functions#hl_groups()
  execute("hi! link javaScriptVariable Identifier")
  execute("hi! link javascriptArrowFunc javaScriptVariable")
  execute("hi! link javascriptBraces  Smb")
  execute("hi! link javascriptParens  Smb")
  execute("hi! link javascriptBrackets Smb")
  execute("hi! link javascriptOpSymbol javaScriptVariable")
  execute("hi! link javascriptOpSymbols javaScriptVariable")
  execute("hi! link Type Label")
  execute("hi! link Structure Identifier")
  execute("hi! link xmlTag Function")
  execute("hi! link xmlTagName Function")
  execute("hi! link xmlEqual Normal")
endfunction
function! functions#goyo_enter()
  execute("setlocal cursorline")
endfunction

" Prevent Goyo from breaking color
function! functions#goyo_leave()
  execute("highlight GitGutterAdd    guibg=none")
  execute("highlight GitGutterChange guibg=none")
  execute("highlight GitGutterDelete guibg=none")
  execute("highlight GitGutterChangeDelete guibg=none")
  execute("highlight ALEErrorSign guibg=none guifg=#E1333D")
  execute("highlight ALEWarningSign guibg=none guifg=#FFB454")
  execute("AirlineTheme zenburn")
endfunction

" Toggle LocationList
let g:loclist_is_open = 0
function! functions#LoclistToggle()
if g:loclist_is_open == 1
    lclose
    let g:loclist_is_open = 0
else
  lopen
    let g:loclist_is_open = 1
endif
endfunction

" Toggle QuickFixList
let g:qflist_is_open = 0
function! functions#QucikFixToggle()
  if g:qflist_is_open == 1
    cclose
    let g:qflist_is_open = 0
  else
    copen
    let g:qflist_is_open = 1
  endif
endfunction

" filter  /^.*\(\wiki\)\@<!$/ oldfiles
" function! s:filtered_hist()
"     call filter(v:oldfiles, 'v:val !~ "\\.wiki"')
"   return fzf#vim#_uniq(map(
"     \ filter([expand('%')], 'len(v:val)')
"     \   + filter(map(s:buflisted_sorted(), 'bufname(v:val)'), 'len(v:val)')
"     \   + filter(v:oldfiles, "filereadable(fnamemodify(v:val, ':p'))"),
"     \ 'fnamemodify(v:val, ":~:.")'))
" endfunction
