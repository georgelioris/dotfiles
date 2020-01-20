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
set foldmethod=manual
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

source ~/.config/nvim/color.vim
source ~/.config/nvim/editor.vim
source ~/.config/nvim/terminal.vim
source ~/.config/nvim/fzf.vim


" Custom Mappings
map <F1> :Help <CR>
map <F2> :History <CR>
map <F3> :Files ~/<CR>
nmap Q <Nop>
noremap Y y$
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
nnoremap <leader>m :!node '%:p'<CR>
nnoremap <silent> <Leader>k :call functions#show_documentation()<CR>
map <C-n> :NERDTreeToggle %<CR>
nnoremap <leader><tab> za
nnoremap <leader>f :Buffers<CR>
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
"nnoremap <silent> <leader>p :call functions#QucikFixToggle()<CR>
nnoremap <silent> <leader>e :call functions#LoclistToggle()<CR>
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
map <F4> :Goyo \| set wrap \| set linebreak<CR>
let g:goyo_width = 85
au BufRead,BufNewFile *.wiki set filetype=wiki


" Sell checking
map <leader>o :setlocal spell! spelllang=en_us<CR>
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-f> [s1z=<c-o>
set autoread

" Split bottom right
set splitbelow splitright

" Themes
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Colorscheme customizations
let g:gitgutter_enabled = 0
let g:gitgutter_override_sign_column_highlight = 0
autocmd FocusGained,BufEnter,VimEnter,WinEnter * setlocal cursorline
autocmd FocusLost,WinLeave * set nocursorline
autocmd! User GoyoEnter nested call functions#goyo_enter()
autocmd! User GoyoLeave nested call functions#goyo_leave()
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufEnter,VimEnter,WinEnter,FocusGained * call functions#hl_groups()
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
