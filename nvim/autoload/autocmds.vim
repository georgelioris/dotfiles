autocmd! FocusGained,BufEnter,VimEnter,WinEnter * setlocal cursorline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd! User GoyoEnter nested call functions#goyo_enter()
autocmd! User GoyoLeave nested call functions#goyo_leave()
autocmd! BufEnter,VimEnter,WinEnter,FocusGained * call functions#hl_groups()
