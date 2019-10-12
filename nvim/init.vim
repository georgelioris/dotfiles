syntax on
set number
set nocompatible
set termguicolors
set nowrap
filetype plugin indent on
let mapleader = "\<Space>"
set ruler
set showcmd
set tabstop=2
set shiftwidth=0
set foldmethod=indent
set foldlevelstart=99
set fcs=eob:\  " Hide EndOfBuffer fillchar
set mouse=a
set ignorecase
set smartcase

" Vim Plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'easymotion/vim-easymotion'
Plug 'othree/yajs.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ayu-theme/ayu-vim'
Plug 'mxw/vim-jsx'
Plug 'Shutnik/jshint2.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
"Plug 'pangloss/vim-javascript'
"Plug 'xabikos/vscode-react'
" Initialize plugin system
call plug#end()

" Custom Mappings
nmap Q <Nop>
noremap Y y$
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
nnoremap M :!node '%:p'<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
map <C-n> :NERDTreeToggle %<CR>
nnoremap <tab> za
nnoremap <silent> <leader>t :nohlsearch<CR>
nnoremap <leader>a :ALEToggle<CR>
nnoremap <leader>r :registers<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :xit<CR>
noremap <leader>p :echo expand('%')<CR>
noremap <leader>pp :let @+=expand('%') <Bar> :echo expand('%')<CR>
nnoremap <leader>z :ALEToggleFixer<CR>
nnoremap <leader><leader> <C-^>

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

" Easy Motion
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" MinimalNERDTree
let g:NERDTreeMinimalUI = 1
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

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

" Themes
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:airline_theme='zenburn'
set background=dark
let g:airline_powerline_fonts = 1
let ayucolor="dark"
colorscheme base16-oceanicnext
" let g:airline_theme='ayu_dark'

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
  \ }

" Js Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'json': ['prettier']
\}
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 5
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight ALEErrorSign guibg=#22282E guifg=#E1333D
highlight clear ALEWarningSign

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
au BufRead *.png,*.jpg,*.jpeg :call DisplayImage()

function! DisplayImage()
execute '!ueimg %'
:bp | :bw #
endfunction

" Colorscheme customizations
highlight Normal guibg=#0A0C0E
"hi NormalNC  guibg=#22282E
"autocmd FocusLost,WinLeave * :hi Normal guibg=#0a0c0e
autocmd FocusLost,WinLeave * set nocursorline
autocmd FocusGained,BufEnter,VimEnter,WinEnter * :hi Normal guibg=#0a0c0e
autocmd FocusGained,BufEnter,VimEnter,WinEnter * setlocal cursorline
