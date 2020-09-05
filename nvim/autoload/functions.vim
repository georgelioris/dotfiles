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
  execute("hi! link typescriptBraces  Smb")
  execute("hi! link typescriptParens  Smb")
  execute("hi! link typescriptBrackets Smb")
  execute("hi! link typescriptOpSymbol javaScriptVariable")
  execute("hi! link typescriptOpSymbols javaScriptVariable")
  execute("hi! link typescriptCall Special")
  execute("hi! link typescriptArrowFunc javaScriptVariable")
  execute("hi! link tsxCloseString Function")
  execute("hi! link typescriptImport Function")
  execute("hi! link xmlAttrib Label")
  execute("hi! link tsxAttrib Label")
  execute("hi! link Type Statement")
  execute("hi! link Structure Identifier")
  execute("hi! link xmlTag Function")
  execute("hi! link xmlTagName xmlTag")
  execute("hi! link xmlEqual Normal")
  execute("hi! link htmlSpecialTagName htmlTag")
  execute("hi! link typescriptArrowFuncArg Special")
  execute("hi! link VimwikiMarkers Comment")
  execute("hi LineNr guibg=none")
  execute("hi NonText guibg=NONE")
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
function! functions#QuickFixToggle()
  if g:qflist_is_open == 1
    cclose
    let g:qflist_is_open = 0
  else
    copen
    let g:qflist_is_open = 1
  endif
endfunction

" Cycle through hunks in current buffer
function! functions#GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction

" Get hl-group under cursor
function! functions#SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! functions#PickColor(default_color)
  if has('mac')
    let default_color = map(a:default_color, {idx, val -> str2nr(val) * 65535 / 255 })
    " This is the AppleScript magic:
    let s:ascrpt = ['-e "tell application \"' . s:app . '\""',
          \ '-e "' . s:activate . '"',
          \ "-e \"set AppleScript's text item delimiters to {\\\",\\\"}\"",
          \ '-e "set theColor to (choose color default color {' . default_color[0] . ", " . default_color[1] . ", " . default_color[2] . '}) as text"',
          \ '-e "' . s:quit . '"',
          \ '-e "end tell"',
          \ '-e "return theColor"']
    let res = trim(system("osascript " . join(s:ascrpt, ' ') . " 2>/dev/null"))
    if empty(res)
      return v:false
    else
      return split(trim(res), ',')
    endif
  endif

  let hex_color = printf('#%02x%02x%02x', a:default_color[0], a:default_color[1], a:default_color[2])

  if has('unix')
    if executable('zenity')
      let res = trim(system('zenity --title="Select a color" --color-selection --color="' . hex_color . '" 2> /dev/null'))
      if empty(res)
        return v:false
      else
        " res format is rgb(255,255,255)
        return map(split(res[4:-2], ','), {idx, val -> string(str2nr(trim(val)) * 65535 / 255)})
      endif
    endif
  endif

  let rgb = v:false
  if !has('python')
    echohl Error | echom 'python support required, checkout :echo has(''python'')' | echohl None
    return
  endif
  try
    execute 'py import gtk'
  catch /.*/
    echohl Error | echom 'python gtk module not found' | echohl None
    return
  endtry
python << endpython

import vim
import gtk, sys

# message strings
wnd_title_insert = "Insert a color"

csd = gtk.ColorSelectionDialog(wnd_title_insert)

csd.connect("destroy", gtk.main_quit)

cs = csd.colorsel

cs.set_current_color(gtk.gdk.color_parse(vim.eval("hex_color")))

cs.set_current_alpha(65535)
cs.set_has_opacity_control(False)
# cs.set_has_palette(int(vim.eval("s:display_palette")))


def on_cancel(button):
    csd.destroy()

def on_ok(button):
    c = cs.get_current_color()
    s = [str(int(c.red)),',',str(int(c.green)),',',str(int(c.blue))]
    thecolor = ''.join(s)
    vim.command(":let rgb = split('%s',',')" % thecolor)

csd.ok_button.connect("clicked", on_ok)
csd.cancel_button.connect("clicked", on_cancel)
csd.show_all()
gtk.main()


endpython
 execute('echo rgb')
  return rgb
endfunction
