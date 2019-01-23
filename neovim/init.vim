""" Platy's Neovim config

""" Vim-Plug
call plug#begin()

" Aesthetics
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'

" Functionalities
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/neoinclude.vim'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm -g install tern' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/LargeFile'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'w0rp/ale', { 'do': 'npm -g install eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-standard; pip3 install flake8' }
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'majutsushi/tagbar', { 'do': 'brew install ctags-exuberant' }
Plug 'hushicai/tagbar-javascript.vim', { 'do': 'npm -g install esctags' }

call plug#end()


""" Anti-Pleb rebindings (Arrow keys still work in insert mode)
nnoremap <Up> <nop>
vnoremap <Up> <nop>
nnoremap <Down> <nop>
vnoremap <Down> <nop>
nnoremap <Left> <nop>
vnoremap <Left> <nop>
nnoremap <Right> <nop>
vnoremap <Right> <nop>

""" Coloring
let g:space_vim_dark_background = 234
syntax on
colorscheme space-vim-dark
highlight clear Comment
highlight Comment cterm=italic guifg=#7c7c7c
set number
set termguicolors
let g:python_highlight_all = 1
let g:python_slow_sync = 0


""" Other config
set encoding=UTF-8
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ai " Autoindent
set si " Smartindent
" set smarttab
set wrap " Wrap lines
set tabstop=4 shiftwidth=4 
set tabstop=4
set softtabstop=4
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
set cursorline
set splitright
" set incsearch
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to last edit position
au TermOpen * setlocal nonumber norelativenumber


""" Optimisation config
set lazyredraw
set ttyfast
set foldmethod=syntax
set foldmethod=expr
set noshowcmd
set noruler
" set eventignore=all " Uncommenting this line stops deoplete and gitgutter from working


""" Mappings
" Ctrl-o to open sidebar
nmap <C-o> :NERDTreeToggle<CR>

" Better window switching
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Better tab switching
"nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
"nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nmap <C-t> :tabnew<CR>

" Activate rainbow parentheses \r
nmap <leader>r :RainbowParentheses!!<CR>

" Activate Limelight \l
nmap <leader>l :Limelight!!<CR>

" Activate Goyo \G
nmap <leader>G :Goyo <bar> :highlight clear Comment <CR> :highlight Comment cterm=italic guifg=#7c7c7c<CR>

" Activate Deoplete \d
nmap <leader>d :call deoplete#toggle()<CR>

" Activate Transparent mode \t
nmap <leader>t :call ToggleTransparentMode()<CR>

" Activate GitGutter \g
nmap <leader>g :GitGutterToggle<CR> 

" Spawn shell \s
nmap <leader>s :vsp \| term<CR> i

" Toggle ALE \a
nmap <leader>a :ALEToggle<CR>

" UndoTree
nmap <Tab> :UndotreeToggle<CR>

" TagBar
nmap <S-Tab> :TagbarToggle<CR>

" Vim Fugitive
nnoremap <silent> <leader>gp :Gpull -pr<CR>
nnoremap <silent> <leader>gf :Gfetch -p<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>

"
""" Deoplete
autocmd InsertEnter * call deoplete#enable()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
set completeopt-=preview

" C/C++
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'

" JS
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000

" Allow better window switching in terminal mode
augroup vimrc_term
    autocmd!
    autocmd WinEnter term://* nohlsearch
    autocmd WinEnter term://* startinsert
    autocmd TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
    autocmd TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
    autocmd TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
    autocmd TermOpen * tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
    autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
augroup END


""" Set transparency
function SetTransparentBackground()
    highlight Normal ctermbg=NONE guibg=NONE
    highlight LineNr ctermbg=NONE guibg=NONE
    highlight SignColumn ctermbg=NONE guibg=NONE
endfunction

function UnsetTransparentBackground()
    colorscheme space-vim-dark
    highlight Comment cterm=italic guifg=#7c7c7c
    highlight clear Comment
endfunction

let s:transparent = 0
function ToggleTransparentMode()
    if s:transparent
        call UnsetTransparentBackground()
        let s:transparent = 0
    else
        call SetTransparentBackground()
        let s:transparent = 1
    endif
endfunction


""" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1


""" Limelight
let g:limelight_conceal_ctermfg = 254


""" Rainbow Parentheses
au VimEnter * RainbowParentheses " Enable Rainbow Parentheses by default


""" Git Gutter
" set signcolumn=yes
" au VimEnter * GitGutterDisable
set updatetime=50


""" NERD Tree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
