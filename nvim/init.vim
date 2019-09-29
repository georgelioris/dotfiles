syntax on
set number
set nocompatible
set nowrap
set termguicolors
filetype plugin indent on
let mapleader = " "
set ruler
set showcmd
set tabstop=2
set shiftwidth=0

" Vim Plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'othree/yajs.vim'
"Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
"Plug 'xabikos/vscode-react'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'larsbs/vimterial_dark'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ervandew/supertab',
Plug 'ayu-theme/ayu-vim'
Plug 'mxw/vim-jsx'
Plug 'Shutnik/jshint2.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
" Initialize plugin system
call plug#end()


" Arrow binds
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <silent> , :nohlsearch<CR>
" Vim Ctrlp
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node*     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Move between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy Motion
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" NERDTREE
map <C-n> :NERDTreeToggle %<CR>

" Wiki setup
map <leader>f :Goyo \| set wrap \| set linebreak<CR>
let g:goyo_width = 85

" Sell checking
map <leader>o :setlocal spell! spelllang=en_us<CR>
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-f> [s1z=<c-o>
set autoread

"Split bottom right
set splitbelow splitright

"set wildmode=longest,list,full

" Themes
let g:airline_powerline_fonts = 1
let ayucolor="dark"
color ayu
let g:airline_theme='ayu_dark'
set background=dark
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"Js
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\}
syntax enable
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
map <leader>a :ALEToggle <CR>
let g:ale_list_window_size = 5
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
highlight clear SignColumn

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

"Use Tab for snippets
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

"let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%severity%] %s'
"let g:ale_loclist_msg_format = '%s '
"let g:ale_set_loclist = 1
"let g:ale_set_quickfix = 0
"let g:ale_open_list = 1
"let g:ale_list_vertical = 1
"let g:ale_list_window_size = 80
