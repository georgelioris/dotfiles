syntax on
set number
set nocompatible
set nowrap
filetype plugin indent on
let mapleader = "\<Space>"
set ruler
set showcmd
set tabstop=2
set shiftwidth=0
set expandtab
set foldmethod=indent
set foldlevelstart=99
set fcs=eob:\  " Hide EndOfBuffer fillchar
set mouse=a
set ignorecase
set smartcase
set hidden
set undofile
set undodir=~/.config/nvim/undodir
set updatetime=200
set encoding=utf-8

" Vim Plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'othree/yajs.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki', {'for': 'wiki'}
Plug 'w0rp/ale'
Plug 'jparise/vim-graphql'
Plug 'romainl/Apprentice'
Plug 'nanotech/jellybeans.vim'
"Plug 'xabikos/vscode-react'
" Initialize plugin system
call plug#end()


" Custom Mappings
map <F1> :Help <CR>
map <F2> :History <CR>
map <F3> :Files ~/<CR>
nmap Q <Nop>
noremap Y y$
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
nnoremap M :!node '%:p'<CR>
nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
map <C-n> :NERDTreeToggle %<CR>
nnoremap <leader><tab> za
nnoremap <silent> <leader>h :nohlsearch<CR>
nnoremap <leader>t :GitGutterToggle<CR>
nnoremap <leader>a :ALEToggle<CR>
nnoremap <leader>r :registers<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :xit<CR>
noremap <leader>g :echo expand('%')<CR>
noremap <leader>gg :let @+=expand('%') <Bar> :echo expand('%')<CR>
nnoremap <leader>z :ALEToggleFixer<CR>
nnoremap <leader><leader> <C-^>
nnoremap <C-p> :call FzfOmni()<CR>
nnoremap <Leader>p :RG<CR>
"nnoremap <silent> <leader>p :call QucikFixToggle()<CR>
nnoremap <silent> <leader>e :call LoclistToggle()<CR>
nmap gt <C-]>
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Move between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" MinimalNERDTree
let g:NERDTreeMinimalUI = 1
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Wiki setup
map <leader>f :Goyo \| set wrap \| set linebreak<CR>
let g:goyo_width = 85
au BufRead,BufNewFile *.wiki set filetype=wiki


" Sell checking
map <leader>o :setlocal spell! spelllang=en_us<CR>
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-f> [s1z=<c-o>
set autoread

"Split bottom right
set splitbelow splitright

" Themes
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Inspired by Overreacted.io
let g:jellybeans_overrides = {
\    'background': { 'guibg': '0a0c0e' },
\    'SpellCap': {'guibg': 'none', 'ctermbg': 'none'},
\    'DbgCurrent': {'guibg': '0a0c0e'},
\    'LineNr': {'guibg': 'none'},
\    'SignColumn': {'guibg': 'none'},
\    'Special': {'guifg': 'ffcb8b' },
\    'Statement': {'guifg': 'ffa7c4' },
\    'javaScriptVariable': {'guifg':'c792ea'},
\    'Identifier': {'guifg': 'ffcb8b'},
\    'Structure': {'guifg': 'c792ea'},
\    'Function': {'guifg': '82aaff'},
\    'Label': {'guifg':''},
\    'Type': {'guifg':'c792ea'},
\    'PreProc': {'guifg': '82aaff'},
\    'CocFloating': {'guibg': '1c1c1c'},
\    'Pmenu': {'guibg': '1c1c1c', 'guifg': '888888'},
\    'PmenuSBar': {'guibg': '0f0f0f'},
\    'PmenuThumb': {'guibg': '888888'},
\    'PmenuSel': {'guifg': 'f0a0c0', 'guibg': '302028'},
\    'MsgSeparator': {'guibg': '1c1c1c'},
\    'javascriptArrowFunc': {'guifg': 'c792ea'},
\    'javascriptBraces': {'guifg': 'c792ea'},
\    'javascriptBrackets': {'guifg': 'c792ea'},
\    'javascriptParens': {'guifg': 'c792ea'},
\    'String': {'guifg': 'addb67'},
\    'javascriptOpSymbol': {'guifg': 'c792ea'},
\    'Constant': {'guifg': 'ffa7c4'}
\}

let g:jellybeans_use_term_italics = 1
let g:jellybeans_use_lowcolor_black = 1
color jellybeans
let g:airline_theme='zenburn'
set background=dark
let g:airline_powerline_fonts = 1

" FZF.vim configuration
let g:fzf_prefer_tmux = 1
let $FZF_DEFAULT_COMMAND = 'fd --type f -H --follow --ignore-file ~/.fzfignore --no-ignore'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --ignore-file ~/.fzfignore --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let options = fzf#vim#with_preview(options)
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"FZF Omni
function! FzfOmni()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles --exclude-standard --cached --others
  endif
endfunction

"FZF Colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim')
  function! s:create_float(hl, opts)
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
    call setwinvar(win, '&colorcolumn', '')
    return buf
  endfunction

" FZF Floating Window

  function! FloatingFZF()
    " Size and position
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)

    " Border
    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let border = [top] + repeat([mid], height - 2) + [bot]

    " Draw frame
    let s:frame = s:create_float('Comment', {'row': row, 'col': col, 'width': width, 'height': height})
    call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

    " Draw viewport
    call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
    autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

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
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '%s - [%linter%]'
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 3
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
highlight ALEErrorSign guibg=none guifg=#E1333D
highlight ALEWarningSign guibg=none guifg=#FFB454

" Use Tab for snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Show documentation in preview window function
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Preview Image with ueberzug
"au BufRead *.png,*.jpg,*.jpeg :call DisplayImage()
"
"function! DisplayImage()
"execute '!ueimg %'
":bp | :bw #
"endfunction

" Colorscheme customizations
let g:gitgutter_enabled = 0
let g:gitgutter_override_sign_column_highlight = 0
" Vim GitGutter
highlight GitGutterAdd    guibg=none
highlight GitGutterChange guibg=none
highlight GitGutterDelete guibg=none
highlight GitGutterChangeDelete guibg=none
"highlight SignColumn guibg=none
" Overide line numbers
"highlight LineNr guibg=none guifg=#686868
" Overide Background
"highlight Normal guibg=none
"autocmd FocusGained,BufEnter,VimEnter,WinEnter * :highlight Normal guibg=#0a0c0e
autocmd FocusGained,BufEnter,VimEnter,WinEnter * setlocal cursorline
autocmd FocusLost,WinLeave * set nocursorline
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" autocmd FocusGained,BufEnter,VimEnter,WinEnter * :GitGutterDisable
" hi NormalNC  guibg=#22282E
" autocmd FocusLost,WinLeave * :hi Normal guibg=#0a0c0e
function! s:goyo_enter()
  execute("highlight Normal guibg=#0a0c0e")
  execute("setlocal cursorline")
endfunction

function! s:goyo_leave()
  execute("set nocursorline")
  execute("highlight GitGutterAdd    guibg=none")
  execute("highlight GitGutterChange guibg=none")
  execute("highlight GitGutterDelete guibg=none")
  execute("highlight GitGutterChangeDelete guibg=none")
  execute("highlight ALEErrorSign guibg=none guifg=#E1333D")
  execute("highlight ALEWarningSign guibg=none guifg=#FFB454")
  execute("AirlineTheme zenburn")
endfunction
"Toggle LocationList
let g:loclist_is_open = 0
function! LoclistToggle()
if g:loclist_is_open == 1
    lclose
    let g:loclist_is_open = 0
else
  lopen
    let g:loclist_is_open = 1
endif
endfunction
"Toggle QuickFixList
let g:qflist_is_open = 0
function! QucikFixToggle()
  if g:qflist_is_open == 1
    cclose
    let g:qflist_is_open = 0
  else
    copen
    let g:qflist_is_open = 1
  endif
endfunction
