syntax on
set relativenumber
set nowrap
filetype plugin indent on
let mapleader = "\<Space>"
set ruler
set title
"set showcmd
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
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set updatetime=200
set undolevels=1000
set encoding=utf-8
set signcolumn=yes
set list
set listchars=tab:⮩\ ,trail:·,nbsp:⎵
set formatoptions-=cro
let &showbreak = ' ⸥'

" Vim Plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
" Plug 'evanleck/vim-svelte', {'for':  'svelte'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/yajs.vim', {'for': ['js', 'jsx', 'ts', 'tsx']}
Plug 'HerringtonDarkholme/yats.vim', {'for': ['ts', 'tsx']}
Plug 'mxw/vim-jsx', {'for': ['tsx', 'jsx']}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'vimwiki/vimwiki', {'for': [ 'wiki', 'markdown' ]}
Plug 'w0rp/ale' ", {'for': ['javascript', 'javascript.jsx', 'json', 'reason']}
Plug 'nanotech/jellybeans.vim'
Plug 'gruvbox-community/gruvbox'
" Plug 'reasonml-editor/vim-reason-plus', {'for': 're'}
Plug 'xabikos/vscode-react'
Plug 'machakann/vim-highlightedyank'
" Plug 'jparise/vim-graphql', {'for': 'gql'}
" Plug 'jelera/vim-javascript-syntax', {'for': ['js', 'jsx']}
" Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx']}
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
map <F5> :call functions#PickColor(@")<CR>
nmap Q <Nop>
nmap diq di'
nmap diQ di"
noremap Y y$
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
vnoremap <leader>p "_dP
nnoremap <leader>m :call functions#run(0)<CR>
nnoremap <leader>M :call functions#run(1)<CR>
nnoremap M :ALEFix<CR>
map <C-n> :TreeToggle<CR>
nnoremap <leader><tab> za
nnoremap <leader>f :Buffers<CR>
nnoremap <silent> <leader>h :nohlsearch<CR>
nnoremap <leader>a :call functions#ALEToggle()<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :xit<CR>
noremap <leader>g :echo expand('%')<CR>
noremap <leader>gg :let @+=expand('%') <Bar> :echo expand('%')<CR>
nnoremap <leader>z :call functions#ALEToggleFixer()<CR>
nnoremap <leader><leader> <C-^>
nnoremap <C-p> :call FzfOmni()<CR>
nnoremap <leader>p :RG<CR>
"nnoremap <silent> <leader>p :call functions#QuickFixToggle()<CR>
nnoremap <silent> <leader>e :call functions#LoclistToggle()<CR>
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
nnoremap <down> :cnext<CR>
nnoremap <up> :cprev<CR>

" Coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <Leader>k :call functions#show_documentation()<CR>
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>cc :CocCommand<CR>

:command! Fuzzy :call FzfOmni()

" GitGutter
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nnoremap <leader>d :GitGutterFold<CR>
nnoremap <leader>t :call functions#GitGutterNextHunkCycle()<CR>

" Fugitive
nmap <leader>gs :Git<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" Move between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" MinimalNERDTree
let g:NERDTreeMinimalUI = 1
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:NERDTreeIgnore = ['^node_modules$']

" Wiki setup
map <F4> :Goyo \| set wrap \| set linebreak<CR>
let g:goyo_width = 85
au BufRead,BufNewFile,BufEnter *.md set filetype=markdown
au BufRead,BufNewFile *.wiki set filetype=wiki
au FileType vimwiki setlocal textwidth=84
au FileType vimwiki setlocal nonumber
au FileType vimwiki set wrap
au FileType vimwiki set linebreak
au FileType vimwiki set linebreak
au FileType vimwiki hi! link VimwikiMarkers Comment
let g:vimwiki_ext2syntax = {'.md': 'markdown',
                  \ '.mkd': 'markdown',
                  \ '.wiki': 'media'}

" Spell checking
map <silent> <leader>o :setlocal spell! spelllang=en_us<CR>
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-f> [s1z=<c-o>
set autoread

" Split bottom right
set splitbelow splitright
let g:peekaboo_window	 = 'vert bo 40new'

" Themes
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
lua require'colorizer'.setup()
let g:highlightedyank_highlight_duration = 200

set pyx=3
let g:python_host_prog = '/bin/python2'
let g:python3_host_prog = '/bin/python3'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Colorscheme customizations
let g:gitgutter_enabled = 1
let g:gitgutter_override_sign_column_highlight = 0
autocmd FocusGained,BufEnter,VimEnter,WinEnter * setlocal cursorline
autocmd FocusLost,WinLeave * set nocursorline
autocmd! User GoyoEnter nested call functions#goyo_enter()
autocmd! User GoyoLeave nested call functions#goyo_leave()
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au! BufWritePost *.vim source %
au! FileType qf set norelativenumber number wrap nolist
au BufRead,BufEnter *.png,*.jpg,*.jpeg :terminal ueimg %:p
" autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('Substitute', 200)
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 SO   :so ~/.config/nvim/init.vim
command! -nargs=0 BD   :call functions#BD()
command! TreeToggle :call functions#TreeToggle()
