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

" Execute file in terminal or pager
function! functions#run(term)
let l:path = expand('%')
let l:type = &filetype
let l:nodemon = 'nodemon --config ~/.config/nodemon.json '
let l:runtimes = {
  \ 'javascript':  {'term': l:nodemon , 'pager': 'node' },
  \ 'javascript.jsx': {'term': l:nodemon , 'pager': 'node' },
  \ 'javascriptreact': {'term': l:nodemon, 'pager': 'node' },
  \ 'typescript': {'term': l:nodemon . ' --exec deno run', 'pager': 'NO_COLOR=true deno run' },
  \ 'typescriptreact': {'term': l:nodemon . ' --exec deno run', 'pager': 'NO_COLOR=true deno run' },
  \ 'python': {'term': l:nodemon . ' --exec python', 'pager': 'python' },
  \}
let l:cmd = has_key(l:runtimes, &filetype)
  if (l:cmd && a:term)
    rightbelow new | res 12 | terminal
    setlocal nonu
    setlocal nornu
    call chansend(b:terminal_job_id, [join([
          \l:runtimes[type].term,
          \l:path],
          \' '), ''])
    wincmd w
  elseif (l:cmd && !a:term)
    execute(':!'.l:runtimes[type].pager . ' %:p')
  else
  echohl Error | echo "Cannot execute file format: " . &filetype | echohl None
  endif
endfunction

" Fzf prompt to delete buffers
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

function! functions#BD()
call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
  \ }))
endfunction

" Prevent Goyo from breaking color
function! functions#goyo_enter()
  execute("setlocal cursorline")
endfunction
function! functions#goyo_leave()
  execute("AirlineTheme zenburn")
endfunction

function! functions#ALEToggle()
  ALEToggle
  if g:ale_enabled
    echohl Type | echo 'ALE On' | echohl None
  else
    echohl Constant | echo 'ALE Off' | echohl None
  endif
endfunction

command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
function! functions#ALEToggleFixer()
  ALEToggleFixer
  if g:ale_fix_on_save
    echohl Type | echo 'Formater On' | echohl None
  else
    echohl Constant | echo 'Formater Off' | echohl None
  endif
endfunction

" Highlight file on NERDTreeToggle VSCode style
let g:the_tree_is_open = 0
function! functions#TreeToggle()
if g:the_tree_is_open == 1
    NERDTreeToggleVCS
    let g:the_tree_is_open = 0
elseif (g:the_tree_is_open == 0 && ( expand('%') != '' ))
    let is_git = system('git status')
    if v:shell_error
      NERDTreeToggle %
    else
      NERDTreeFind %:p
    endif
    let g:the_tree_is_open = 1
else
    echohl ALEVirtualTextWarning | echo "Can't open NERDTree here!" | echohl None
endif
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
