""" Platy's Ultimate Neovim Config

""" Vim-Plug -----------------------------------------------------------------
call plug#begin()                                                       " Plugin manager Vim-Plug

"" Aesthetics
Plug 'liuchengxu/space-vim-dark'                                        " Colour Scheme SpaceVimDark
Plug 'vim-airline/vim-airline'                                          " Plugin that gives blocks on the top and bottom neovim
Plug 'vim-airline/vim-airline-themes'                                   " Imports a library of themes for vim-arline
Plug 'ryanoasis/vim-devicons'                                           " Allows for nerdfont icons to be displayed
Plug 'junegunn/limelight.vim'                                           " Grey-out paragraphs the cursor is not on
Plug 'junegunn/vim-journal'                                             " Nicer syntax highlighting for markdown
Plug 'pangloss/vim-javascript'                                          " Nicer syntax highlighting for javascript
Plug 'vim-python/python-syntax'                                         " Nicer syntax highlighting for python
Plug 'junegunn/rainbow_parentheses.vim'                                 " Adds rainbow colouring for nested parenthesis
Plug 'junegunn/goyo.vim'                                                " Distraction-free setting
Plug 'mhinz/vim-startify'                                               " Better startup screen for vim

"" Functionalities
Plug 'airblade/vim-gitgutter'                                           " Shows git diff in vim's gutter
Plug 'scrooloose/nerdtree'                                              " Shows file tree
Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}             " Auto-completion plugin
Plug 'shougo/neoinclude.vim'                                            " Completion framework for deoplete
Plug 'zchee/deoplete-clang'                                             " Auto-Completion support for C/C++
Plug 'zchee/deoplete-jedi'                                              " Auto-Completion support for Python
Plug 'carlitux/deoplete-ternjs', {'do': 'npm -g install tern'}          " Auto-Completion support for Javascript
Plug 'terryma/vim-multiple-cursors'                                     " Sublime-styled multiple cursors support
Plug 'tpope/vim-fugitive'                                               " Git wrapper
Plug 'vim-scripts/LargeFile'                                            " Edit large files quickly
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                        " Undo visualiser
Plug 'w0rp/ale', {'do': 'npm -g install eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-standard; pip3 install flake8'}                                                                   " Asynchronous linting
Plug 'kien/ctrlp.vim'                                                   " Fuzzy finder
Plug 'majutsushi/tagbar', {'do': 'brew install ctags-exuberant'}        " Shows tags while programming
Plug 'hushicai/tagbar-javascript.vim', {'do': 'npm -g install esctags'} " Shows tags for javascript
Plug 'jiangmiao/auto-pairs'                                             " Insert/delete brackets/quotes in pairs

call plug#end()
""" End Of Vim-Plug -----------------------------------------------------------


""" Plugin Colouring ----------------------------------------------------------
let g:space_vim_dark_background = 234
let g:python_highlight_all = 1
let g:python_slow_sync = 0
""" End Of Plugin Colouring ---------------------------------------------------


""" Vanilla Colouring ---------------------------------------------------------
syntax on
set termguicolors
colorscheme space-vim-dark
highlight clear Comment
highlight Comment cterm=italic guifg=#7c7c7c
highlight ColorColumn guifg=#ff0000 guibg=#000000
""" End Of Vanilla Colouring --------------------------------------------------


""" Vanilla Configurations ----------------------------------------------------
set number
set encoding=UTF-8
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set autoindent
set smartindent
set wrap " Wrap lines
set tabstop=4 shiftwidth=4 
set tabstop=4
set softtabstop=4
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
set cursorline
set splitright
au TermOpen * setlocal nonumber norelativenumber
set clipboard=unnamed
call matchadd('ColorColumn', '\%101v', 100)
""" End Of Vanilla Configurations ----------------------------------------------


""" Optimisation ---------------------------------------------------------------
set lazyredraw
set ttyfast
set foldmethod=syntax
set foldmethod=expr
set showcmd
set noruler
" set eventignore=all " Ultimate optimisation. Basically no plugins or anything run
""" End Of Optimisation ---------------------------------------------------------


""" Vanilla Rebindings -------------------------------------------------------
"" Rebinds arrow keys to increase/decrease size of pane while in normal/visual mode
" Increase horizontal split
nnoremap <silent> <Up> :resize +2 <CR>
vnoremap <silent> <Up> :resize +2 <CR>
" Decrease horizontal split
nnoremap <silent> <Down> :resize -2 <CR>
vnoremap <silent> <Down> :resize -2 <CR>
" Increase vertical split
nnoremap <silent> <Left> :vertical resize -2 <CR>
vnoremap <silent> <Left> :vertical resize -2 <CR>
" Decrease horizontal split
nnoremap <silent> <Right> :vertical resize +2 <CR>
vnoremap <silent> <Right> :vertical resize +2 <CR>

"" Better window switching
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

"" Better tab switching
nmap <silent><C-t> :tabnew<CR>

"" Remap semicolon to colon
nnoremap ; :
""" End Of Vanilla Rebindings -------------------------------------------------


""" Vim-Airline Configurations ------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
""" End Of Vim-Airline Configurations -----------------------------------------


""" Limelight Configurations --------------------------------------------------
"" Mappings
" Activate Limelight   \l
nmap <leader>l :Limelight!!<CR>

"" Colour
let g:limelight_conceal_ctermfg = 254
""" End Of Limelight Configurations -------------------------------------------


""" Vim Journal Configurations ------------------------------------------------
au BufNewFile,BufRead *.md set filetype=journal
""" End Of Vim Journal Configurations -----------------------------------------


""" Rainbow Parentheses Configurations ----------------------------------------
"" Mappings
" Activate Rainbow Parentheses    \r
nmap <leader>r :RainbowParentheses!!<CR>

"" Auto Commands
au VimEnter * RainbowParentheses " Enable Rainbow Parentheses by default
""" End Of Rainbow Parentheses Configurations ---------------------------------


""" Goyo Configurations -------------------------------------------------------
"" Mappings
" Activate Goyo    \G
nmap <leader>G :Goyo <bar> :highlight clear Comment <CR> :highlight Comment cterm=italic guifg=#7c7c7c<CR>
""" End Of Goyo Configurations ------------------------------------------------


""" Git Gutter Configurations -------------------------------------------------
"" Mappings
" Activate GitGutter    \g
nmap <leader>g :GitGutterToggle<CR> 

"" Settings
set updatetime=50
" set signcolumn=yes
" au VimEnter * GitGutterDisable
""" End Of Git Gutter Configurations ------------------------------------------


""" Nerd Tree Configurations --------------------------------------------------
"" Mappings
" Activate Nerd Tree    Ctrl-o
nmap <C-o> :NERDTreeToggle<CR>

"" Settings
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""" End Of Nerd Tree Configurations -------------------------------------------


""" Deoplete Configurations ---------------------------------------------------
"" Mappings
" Activate Deoplete    \d
nmap <leader>d :call deoplete#toggle()<CR>
inoremap <silent><expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

"" Settings
au InsertEnter * call deoplete#enable()
set completeopt-=preview
" C/C++
let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#sort_algo = 'priority'
" JS
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
""" End Of Deoplete Configurations --------------------------------------------

""" Vim Fugitive Configurations -----------------------------------------------
"" Mappings
nnoremap <silent> <leader>gp :Gpull -pr<CR>
nnoremap <silent> <leader>gf :Gfetch -p<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
""" End Of Vim Fugitive Configurations ----------------------------------------


""" ALE Configurations --------------------------------------------------------
"" Mappings
" Activate ALE    \a
nmap <leader>a :ALEToggle<CR>
""" End Of ALE Configurations -------------------------------------------------


""" Undo Tree Configurations --------------------------------------------------
"" Mappings
" Activate Undo Tree    Tab
nmap <Tab> :UndotreeToggle<CR>

"" Settings
if has("persistent_undo")
    set undodir=~/.cache/undotree
    set undofile
endif
""" End Of UndoTree Configurations --------------------------------------------

""" Tagbar Configurations -----------------------------------------------------
"" Mappings
" Activate Tabar    Shift-Tab
nmap <S-Tab> :TagbarToggle<CR>
""" End Of Tagbar Configurations ----------------------------------------------


""" Vanilla Terminal Support --------------------------------------------------
"" Mappings
" Spawn shell \s
nmap <leader>s :vsp \| term<CR> i
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
""" End Of Vanilla Terminal Support ------------------------------------------


""" Vanilla Transparent Mode -------------------------------------------------
"" Mappings
" Activate Transparent mode    \t
nmap <leader>t :call ToggleTransparentMode()<CR>

"" Functions
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
""" End Of Vanilla Transparent Mode -------------------------------------------
