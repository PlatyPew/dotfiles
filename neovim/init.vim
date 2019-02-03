""" Platy's Ultimate Neovim Config

""" Vim-Plug -----------------------------------------------------------------
call plug#begin()                                                       " Plugin manager Vim-Plug

"" Aesthetics
" Colours
Plug 'liuchengxu/space-vim-dark'                                        " Colour Scheme SpaceVimDark
" User Interface
Plug 'vim-airline/vim-airline'                                          " Plugin that gives blocks on the top and bottom neovim
Plug 'vim-airline/vim-airline-themes'                                   " Imports a library of themes for vim-arline
Plug 'ryanoasis/vim-devicons'                                           " Allows for nerdfont icons to be displayed
Plug 'junegunn/limelight.vim', {'on': 'Limelight!!'}                    " Grey-out paragraphs the cursor is not on
Plug 'junegunn/rainbow_parentheses.vim', {'on': 'RainbowParentheses!!'} " Adds rainbow colouring for nested parenthesis
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}                                " Distraction-free setting
Plug 'mhinz/vim-startify'                                               " Better startup screen for vim
" Syntax highlighting
Plug 'pangloss/vim-javascript'                                          " Nicer syntax highlighting for javascript
Plug 'vim-python/python-syntax'                                         " Nicer syntax highlighting for python
Plug 'octol/vim-cpp-enhanced-highlight'                                 " Nicer syntax highlighting for clang

"" Functionalities
" Git
Plug 'airblade/vim-gitgutter'                                           " Shows git diff in vim's gutter
Plug 'tpope/vim-fugitive'                                               " Git wrapper
Plug 'Xuyuanp/nerdtree-git-plugin'
" File finding
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}                    " Shows file tree
Plug 'kien/ctrlp.vim'                                                   " Fuzzy finder
" Auto-completion
Plug 'shougo/neoinclude.vim'                                            " Completion framework for deoplete
Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}             " Auto-completion plugin
Plug 'zchee/deoplete-clang'                                             " Auto-Completion support for C/C++
Plug 'zchee/deoplete-jedi'                                              " Auto-Completion support for Python
Plug 'carlitux/deoplete-ternjs', {'do': 'npm -g install tern'}          " Auto-Completion support for Javascript
"More efficient (lazy) plugins
Plug 'terryma/vim-multiple-cursors'                                     " Sublime-styled multiple cursors support
Plug 'jiangmiao/auto-pairs'                                             " Insert/delete brackets/quotes in pairs
Plug 'shime/vim-livedown', {'do': 'npm -g install livedown', 'on': 'LivedownToggle'} " Live preview of markdown in browser
Plug 'easymotion/vim-easymotion'                                        " Enhanced mobility in vim
Plug 'scrooloose/nerdcommenter'                                         " Easy commenting
" Misc
Plug 'vim-scripts/LargeFile'                                            " Edit large files quickly
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                        " Undo visualiser
Plug 'w0rp/ale', {'do': 'npm -g install eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-standard; pip3 install flake8'} " Asynchronous linting
Plug 'majutsushi/tagbar', {'do': 'brew install ctags-exuberant'}        " Shows tags while programming
Plug 'hushicai/tagbar-javascript.vim', {'do': 'npm -g install esctags'} " Shows tags for javascript

call plug#end()
""" End Of Vim-Plug -----------------------------------------------------------


""" Plugin Colouring ----------------------------------------------------------
"" Space Vim Dark
let g:space_vim_dark_background = 234
"" Python
let g:python_highlight_all = 1
let g:python_slow_sync = 0
"" Clang
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
""" End Of Plugin Colouring ---------------------------------------------------


""" Vanilla Colouring ---------------------------------------------------------
syntax on                                                               " Enable syntax highlighting
set termguicolors
colorscheme space-vim-dark                                              " Set colour scheme SpaceVimDark
highlight clear Comment
" Set colours for comments
highlight Comment cterm=italic guifg=#7c7c7c
" Set colours for colour coloumn
highlight ColorColumn guifg=#ff0000 guibg=#1c1c1c
""" End Of Vanilla Colouring --------------------------------------------------


""" Vanilla Configurations ----------------------------------------------------
set number
set encoding=UTF-8
set backspace=eol,start,indent
set whichwrap+=<,>,h,l                                                  " Cursor wrap around in normal mode
set autoindent
set smartindent
set wrap
set tabstop=4 shiftwidth=4 
set tabstop=4
set softtabstop=4
set expandtab                                                           " #spacemasterrace
set list listchars=tab:»·,trail:·,nbsp:·                                " Show trailing spaces and hard tabs
set cursorline
set splitright                                                          " Set vertical split to always split to the right
set splitbelow
set clipboard=unnamed                                                   " Share yank and paste buffer with MacOS' pbcopy and pbpaste
call matchadd('ColorColumn', '\%101v[^\n]')                             " Show colour coloumn only at lines that pass 101 characters
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
" Move to pane on the left      Ctrl-h
nmap <C-h> <C-W>h
" Move to lower pane            Ctrl-j
nmap <C-j> <C-W>j
" Move to upper pane            Ctrl-j
nmap <C-k> <C-W>k
" Move to pane on the right     Ctrl-h
nmap <C-l> <C-W>l

"" Better tab
" Create new tabs    Ctrl-t
nmap <silent><C-t> :tabnew<CR>

"" Easy Save
" Save files    Ctrl-s
imap <C-s> <Esc>:w<CR>a

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


""" Rainbow Parentheses Configurations ----------------------------------------
"" Mappings
" Activate Rainbow Parentheses    \r
nmap <leader>r :RainbowParentheses!!<CR>

"" Auto Commands
au VimEnter * RainbowParentheses                                        " Enable Rainbow Parentheses by default
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
set updatetime=50                                                       " Update git gutter every 50ms
" set signcolumn=yes
" au VimEnter * GitGutterDisable
""" End Of Git Gutter Configurations ------------------------------------------


""" Nerd Tree Configurations --------------------------------------------------
"" Mappings
" Activate Nerd Tree    Ctrl-o
nmap <C-o> :NERDTreeToggle<CR>

"" Settings
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = ' '                                 " Closed directory icon
let g:NERDTreeDirArrowCollapsible = ' '                                " Opened directory icon
let NERDTreeShowHidden = 0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""" End Of Nerd Tree Configurations -------------------------------------------


""" Deoplete Configurations ---------------------------------------------------
"" Mappings
" Activate deoplete    \d
nmap <leader>d :call deoplete#toggle()<CR>
" Go down    Tab
inoremap <silent><expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
" Go up      Shift-Tab
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

"" Settings
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
" Show git status    Tab
nnoremap <silent> <leader>gs :Gstatus<CR>
" Show git blame     Tab
nnoremap <silent> <leader>gb :Gblame<CR>
" Show git diff      Tab
nnoremap <silent> <leader>gd :Gdiff<CR>
""" End Of Vim Fugitive Configurations ----------------------------------------


""" ALE Configurations --------------------------------------------------------
"" Mappings
" Activate ALE    \a
nmap <leader>a :ALEToggle<CR>

"" Settings
let g:ale_enabled = 0
""" End Of ALE Configurations -------------------------------------------------


""" Undo Tree Configurations --------------------------------------------------
"" Mappings
" Activate Undo Tree    Tab
nmap <Tab> :UndotreeToggle<CR>

"" Settings
" Loads persistent undo tree to ~/.cache
if has("persistent_undo")
    set undodir=~/.cache/undotree
    set undofile
endif
""" End Of UndoTree Configurations --------------------------------------------


""" Livedown Configurations ---------------------------------------------------
"" Mappings
" Activate Livedown    \L
nmap <leader>L :LivedownToggle<CR>

"" Settings
let g:livedown_autorun = 0
let g:livedown_open = 1 
let g:livedown_port = 1337
let g:livedown_browser = "safari"
""" End Of Livedown Configurations --------------------------------------------


""" Tagbar Configurations -----------------------------------------------------
"" Mappings
" Activate Tabar    Shift-Tab
nmap <S-Tab> :TagbarToggle<CR>
""" End Of Tagbar Configurations ----------------------------------------------


""" Nerd Commenter Configurations ---------------------------------------------
"" Settings
let g:NERDSpaceDelims = 1                                               " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                                           " Use compact syntax for prettified multi-line comments
let g:NERDAltDelims_java = 1                                            " Set a language to use its alternate delimiters by default
let g:NERDTrimTrailingWhitespace = 1                                    " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1                                       " Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#', 'right': '' }
    \ }                                                                 " Fix for double spacing while commenting Python
""" End Of Nerd Commenter Configurations --------------------------------------


""" Vanilla Terminal Support --------------------------------------------------
"" Mappings
" Spawn shell \s
nmap <leader>s :call StartShell()<CR> i

"" Settings
au TermOpen * setlocal nonumber norelativenumber                        " Set no number when opening terminal
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

"" Functions
function StartShell()
    set shell=/bin/zsh
    silent execute("vsp")
    silent execute("term")
endfunction
""" End Of Vanilla Terminal Support ------------------------------------------


""" Vanilla Transparent Mode -------------------------------------------------
"" Mappings
" Activate Transparent mode    \t
nmap <leader>t :call ToggleTransparentMode()<CR>

"" Functions
let s:transparent = 0
function ToggleTransparentMode()
    if s:transparent
        colorscheme space-vim-dark
        highlight clear Comment
        highlight Comment cterm=italic guifg=#7c7c7c
        let s:transparent = 0
    else
        highlight Normal ctermbg=NONE guibg=NONE
        highlight LineNr ctermbg=NONE guibg=NONE
        highlight SignColumn ctermbg=NONE guibg=NONE
        let s:transparent = 1
    endif
endfunction
""" End Of Vanilla Transparent Mode -------------------------------------------


""" Vanilla IDE Mode ----------------------------------------------------------
"" Mappings
" Activate IDE mode    \i
nmap <leader>i :call ToggleIDE()<CR>

let s:ide = 0
function ToggleIDE()
    if s:ide
        set shell=/bin/zsh
        silent execute("norm \<C-h>")
        silent execute("vertical resize +6")
        silent execute("NERDTreeToggle")
        silent execute("TagbarClose")
        silent execute("norm \<C-j>")
        autocmd WinEnter * stopinsert
        silent execute("q")
        silent execute("ALEDisable")
        silent call deoplete#disable()
        let s:ide = 0
    else
        set shell=/bin/bash
        silent execute("NERDTreeToggle")
        silent execute("vertical resize -6")
        silent execute("norm \<C-l>")
        silent execute("sp")
        silent execute("resize -10")
        silent execute("term")
        autocmd WinEnter term://* startinsert
        silent execute("norm \<C-k>")
        silent execute("TagbarOpen")
        silent execute("norm \<C-l>")
        silent execute("vertical resize -8")
        silent execute("norm \<C-h>")
        silent execute("ALEEnable")
        silent call deoplete#enable()
        let s:ide = 1
    endif
endfunction
""" End Of Vanilla IDE Mode ---------------------------------------------------
