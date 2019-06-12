syntax on
set number
set nocompatible
set nowrap
set termguicolors
filetype off
filetype plugin indent on
let mapleader = " "
set ruler
set showcmd
set tabstop=4

" Vim Plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-startify'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
  " For func argument completion
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'rafi/awesome-vim-colorschemes'
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

" Sell checking
map <leader>o :setlocal spell! spelllang=en_us<CR>
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-f> [s1z=<c-o>
set autoread

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
highlight ALEWarning ctermbg=DarkMagenta
map <leader>a :ALEToggle <CR>
"let g:neosnippet#enable_completed_snippet = 1
" deoplete
"let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
"inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"" use tab to backward cycle
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
"" Close the documentation window when completion is done
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
 "" Auto goyo on markdown
"" autocmd Filetype vimwiki :Goyo
"function! s:auto_goyo()
"    if &ft == 'vimwiki'
"        Goyo 80
"    elseif exists('#goyo')
"        let bufnr = bufnr('%')
"        Goyo!
"        execute 'b '.bufnr
"    endif
"endfunction
"
"" augroup VimWikiColor
""   au!
""   autocmd FileType vimwiki colorscheme deep-space
"" augroup END
"" augroup Goyo
""   au!
"    autocmd BufEnter * call s:auto_goyo()
"" augroup END
