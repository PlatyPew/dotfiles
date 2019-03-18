"  ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
" ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
"  ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"   ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"    ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"    ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"      ░░   ▒ ░░      ░     ░░   ░ ░
"       ░   ░         ░      ░     ░ ░
"      ░                           ░

""" Vim-Plug
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/LargeFile'
Plug 'w0rp/ale', {'for': ['c', 'cpp', 'python', 'javascript', 'sh', 'bash']}
call plug#end()

""" Settings
syntax on
colorscheme gruvbox
set termguicolors
set number
set encoding=UTF-8
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set autoindent
set smartindent
set wrap
set tabstop=4 shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
set splitright
set lazyredraw
set ttyfast
set foldmethod=syntax
set foldmethod=expr
set showcmd
set noruler
set noshowmode
set cursorline
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }

""" Mappings
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nnoremap ; :

""" Vim airlines
let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_theme='tomorrow'
nmap <C-o> :NERDTreeToggle<CR>
set ttimeoutlen=10

""" Nerd Tree
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
let NERDTreeShowHidden = 0
augroup nerdtree_stuff
    autocmd!
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
