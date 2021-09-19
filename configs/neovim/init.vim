"  ██▓ ███▄    █  ██▓▄▄▄█████▓      ██▒   █▓ ██▓ ███▄ ▄███▓
" ▓██▒ ██ ▀█   █ ▓██▒▓  ██▒ ▓▒     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
" ▒██▒▓██  ▀█ ██▒▒██▒▒ ▓██░ ▒░      ▓██  █▒░▒██▒▓██    ▓██░
" ░██░▓██▒  ▐▌██▒░██░░ ▓██▓ ░        ▒██ █░░░██░▒██    ▒██
" ░██░▒██░   ▓██░░██░  ▒██▒ ░  ██▓    ▒▀█░  ░██░▒██▒   ░██▒
" ░▓  ░ ▒░   ▒ ▒ ░▓    ▒ ░░    ▒▓▒    ░ ▐░  ░▓  ░ ▒░   ░  ░
"  ▒ ░░ ░░   ░ ▒░ ▒ ░    ░     ░▒     ░ ░░   ▒ ░░  ░      ░
"  ▒ ░   ░   ░ ░  ▒ ░  ░       ░        ░░   ▒ ░░      ░
"  ░           ░  ░             ░        ░   ░         ░
"                               ░       ░

""" Vim-Plug -----------------------------------------------------------------
call plug#begin()                                                       " Plugin manager Vim-Plug

"" Aesthetics
" Colours
Plug 'liuchengxu/space-vim-dark'                                        " Colour Scheme SpaceVimDark
" User Interface
Plug 'vim-airline/vim-airline'                                          " Plugin that gives blocks on the top and bottom neovim
Plug 'vim-airline/vim-airline-themes'                                   " Imports a library of themes for vim-arline
Plug 'ryanoasis/vim-devicons'                                           " Allows for nerdfont icons to be displayed
Plug 'junegunn/rainbow_parentheses.vim', {'on': 'RainbowParentheses!!'} " Adds rainbow colouring for nested parenthesis
Plug 'mhinz/vim-startify'                                               " Better startup screen for vim
Plug 'tiagofumo/vim-nerdtree-syntax-highlight',
            \ {'on': 'NERDTreeToggle'}                                  " Colours for nerd tree
" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}             " Better syntax parser
Plug 'machakann/vim-highlightedyank'

"" Functionalities
" Git
Plug 'airblade/vim-gitgutter'                                           " Shows git diff in vim's gutter
Plug 'tpope/vim-fugitive'                                               " Git wrapper
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
" File finding
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}                     " Shows file tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } , 'on': 'FZF'}        " Fuzzy finder
Plug 'junegunn/fzf.vim'
" Auto-completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"More efficient (lazy) plugins
Plug 'terryma/vim-multiple-cursors'                                     " Sublime-styled multiple cursors support
Plug 'jiangmiao/auto-pairs'                                             " Insert/delete brackets/quotes in pairs
Plug 'easymotion/vim-easymotion'                                        " Enhanced mobility in vim
Plug 'preservim/nerdcommenter'                                          " Easy commenting
Plug 'anyakichi/vim-surround'                                           " Surround highlighted text easier
" Misc
Plug 'vim-scripts/LargeFile'                                            " Edit large files quickly
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                        " Undo visualiser
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'markdown', 'vue']}     " Quick way to generatre html
Plug 'kkoomen/vim-doge', {'do': { -> doge#install() },
            \ 'for': ['c', 'cpp', 'python', 'javascript', 'java']}      " Documentation Generator
Plug 'nvim-treesitter/nvim-treesitter-refactor'                         " Better refactor tool
Plug 'jbyuki/instant.nvim',
            \ {'on': ['InstantStartServer', 'InstantJoinSession']}      " Peer pair programming
Plug 'sbdchd/neoformat',
            \ {'for': ['c', 'cpp', 'python', 'javascript'],
            \ 'on': 'Neoformat'}                                        " Auto formatter
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

call plug#end()
""" End Of Vim-Plug -----------------------------------------------------------

""" Plugin Colouring ----------------------------------------------------------
"" Space Vim Dark
let g:space_vim_dark_background = 234
""" End Of Plugin Colouring ---------------------------------------------------


""" Vanilla Colouring ---------------------------------------------------------
syntax on                                                               " Enable syntax highlighting
" Enable true colours
colorscheme space-vim-dark                                              " Set colour scheme SpaceVimDark
set notermguicolors t_Co=256
highlight LineNr ctermbg=NONE guibg=NONE
highlight clear Comment
" Set colours for comments
highlight Comment cterm=italic ctermfg=8
" Set colours for colour column
highlight ColorColumn ctermfg=9 ctermbg=233
" Set colours for constants
highlight Constant ctermfg=215
""" End Of Vanilla Colouring --------------------------------------------------


""" Vanilla Configurations ----------------------------------------------------
set number relativenumber
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
call matchadd('ColorColumn', '\%101v[^\n]')                             " Show colour coloumn only at lines that pass 101 characters
set noshowmode
set spelllang=en_gb
augroup spell_check
    autocmd!
    autocmd FileType text,markdown,tex setlocal spell
    autocmd FileType text,markdown,tex highlight clear ColorColumn
augroup END
let g:tex_flavor = 'latex'
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
" Decrease vertical split
nnoremap <silent> <Left> :vertical resize -2 <CR>
vnoremap <silent> <Left> :vertical resize -2 <CR>
" Increase vertical split
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
" Create new tabs    \t
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tj :tabNext<CR>
nnoremap <leader>tk :tabprevious<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tq :tabclose<CR>

"" Easy Save
" Save files    Ctrl-s
imap <C-s> <Esc>:w<CR>a

"" Remap semicolon to colon
nnoremap ; :

"" Cycling buffers
nnoremap <leader>bh :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bfirst<CR><CR>
nnoremap <leader>bj :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR><CR>
nnoremap <leader>bk :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR><CR>
nnoremap <leader>bl :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:blast<CR><CR>
nnoremap <leader>bq :bdelete<CR>
""" End Of Vanilla Rebindings -------------------------------------------------


""" Highlighted Yank Configurations -------------------------------------------
"" Colours
highlight HighlightedyankRegion cterm=reverse

"" Settings
let g:highlightedyank_highlight_duration = -1
""" End Of Highlighted Yank Configurations ------------------------------------


""" Vim-Airline Configurations ------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
""" End Of Vim-Airline Configurations -----------------------------------------


""" Rainbow Parentheses Configurations ----------------------------------------
"" Mappings
" Activate Rainbow Parentheses    \r
nmap <leader>r :RainbowParentheses!!<CR>

"" Auto Commands
augroup rainbow_lisp
    autocmd!
    autocmd VimEnter * RainbowParentheses
augroup END
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

let g:rainbow#blacklist = ['foreground', '#d1951d']
""" End Of Rainbow Parentheses Configurations ---------------------------------


""" Git Gutter Configurations -------------------------------------------------
"" Mappings
" Activate GitGutter    \g
nmap <leader>g :GitGutterToggle<CR> 

"" Settings
set updatetime=50                                                       " Update git gutter every 50ms
""" End Of Git Gutter Configurations ------------------------------------------


""" Nerd Tree Configurations --------------------------------------------------
"" Mappings
" Activate Nerd Tree    Ctrl-o
nmap <C-o> :NERDTreeToggle<CR>

"" Settings
let g:NERDTreeDirArrowExpandable = ' '                                 " Closed directory icon
let g:NERDTreeDirArrowCollapsible = ' '                                " Opened directory icon
let NERDTreeShowHidden = 0
augroup nerdtree_stuff
    autocmd!
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Highlight full name and only certain extensions
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cpp', 'py', 'rb', 'js', 'css', 'html', 'java',
  \ 'class', 'md']
let g:NERDTreeSyntaxEnabledExactMatches = ['venv', 'node_modules', 'favicon.ico']

" Open directories with nerdtree instead of netrw
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
""" End Of Nerd Tree Configurations -------------------------------------------


""" FZF Configurations --------------------------------------------------------
"" Settings
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"" Mappings
nnoremap <silent><C-p> :FZF --preview=head\ -13\ {}<CR>
""" End Of FZF Configurations -------------------------------------------------


""" LSP Configurations --------------------------------------------------------
"" Colours
highlight Pmenu ctermfg=247 ctermbg=235
highlight PmenuSel ctermfg=0 ctermbg=13
highlight LspDiagnosticsDefaultError ctermfg=9
highlight LspDiagnosticsDefaultWarning ctermfg=3

"" Mappings
" Go down    Tab
inoremap <silent><expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
" Go up      Shift-Tab
inoremap <silent><expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

"" Settings
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_sorting = "length"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_confirm_key = ""

" LSP settings
lua <<EOF
    local lspconfig = require'lspconfig'
    lspconfig.clangd.setup{
        on_attach = require'completion'.on_attach,
        cmd = { "/usr/local/opt/llvm/bin/clangd", "--background-index", "--clang-tidy" },
        flags = { debounce_text_changes = 500 },
    }

    lspconfig.jedi_language_server.setup{
        on_attach = require'completion'.on_attach,
        cmd = { "jedi-language-server" },
        flags = { debounce_text_changes = 500 },
    }

    lspconfig.tsserver.setup{
        on_attach = require'completion'.on_attach,
        cmd = { "typescript-language-server", "--stdio" },
        root_dir = require'lspconfig/util'.path.dirname,
        flags = { debounce_text_changes = 500 },
    }

    lspconfig.bashls.setup{
        on_attach = require'completion'.on_attach,
        cmd = { "bash-language-server", "start" },
        flags = { debounce_text_changes = 500 },
    }

    lspconfig.texlab.setup{
        on_attach = require'completion'.on_attach,
        cmd = { "texlab" },
        flags = { debounce_text_changes = 500 },
        settings = { texlab = { build = {
            args = { "-halt-on-error", "%f" },
            executable = "pdflatex",
            onSave = true,
        }, }, },
    }
EOF

augroup lspmappings
    autocmd!
    autocmd FileType c,cpp,python,javascript call SetLSPMappings()
augroup END

function SetLSPMappings()
    nmap gd :lua vim.lsp.buf.definition()<CR>
    nmap gh :lua vim.lsp.buf.hover()<CR>
    nmap gre :lua vim.lsp.buf.references()<CR>
    nmap gi :lua vim.lsp.buf.implementation()<CR>
    nmap gR :lua vim.lsp.buf.rename()<CR>
endfunction
""" End Of LSP Configurations -------------------------------------------------


""" Ultisnips Configurations ---------------------------------------------------------
let g:UltiSnipsExpandTrigger="<C-n>"
nnoremap <silent><C-u> :Snippets<CR>
""" End of Ultisnips Configurations --------------------------------------------------


""" Vim Fugitive Configurations -----------------------------------------------
"" Mappings
" Show git status    Tab
nnoremap <silent> <leader>gs :Gstatus<CR>
" Show git blame     Tab
nnoremap <silent> <leader>gb :Gblame<CR>
" Show git diff      Tab
nnoremap <silent> <leader>gd :Gdiff<CR>
""" End Of Vim Fugitive Configurations ----------------------------------------


""" Undo Tree Configurations --------------------------------------------------
"" Mappings
" Activate Undo Tree    Tab
nmap <Tab> :UndotreeToggle<CR>

"" Settings
" Loads persistent undo tree to ~/.cache
if has('persistent_undo')
    set undodir=~/.cache/nvim/undotree
    set undofile
endif
""" End Of UndoTree Configurations --------------------------------------------


""" Autopairs Configurations --------------------------------------------------
"" Settings
augroup quote_pair
    autocmd!
    autocmd FileType vim :let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", "`":"`", '```':'```', "'''":"'''"}
    autocmd FileType tex :let g:AutoPairs = {'(':')', '[':']', '{':'}', "`":"'", "``":"''", '$':'$'}
augroup END
""" End Of Autopairs Configurations -------------------------------------------


""" Tagbar Configurations -----------------------------------------------------
"" Mappings
" Activate Tabar    Shift-Tab
nmap <S-Tab> :TagbarToggle<CR>
""" End Of Tagbar Configurations ----------------------------------------------


""" Nerd Commenter Configurations ---------------------------------------------
"" Settings
let g:NERDSpaceDelims = 1                      " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                  " Use compact syntax for prettified multi-line comments
let g:NERDAltDelims_java = 1                   " Set a language to use its alternate delimiters by default
let g:NERDTrimTrailingWhitespace = 1           " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1              " Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#', 'right': '' }
    \ }                                        " Fix for double spacing while commenting Python
""" End Of Nerd Commenter Configurations --------------------------------------


""" Doge Configurations -------------------------------------------------------
let g:doge_mapping = '<Leader>K'
let g:doge_doc_standard_c = 'kernel_doc'
""" End of Doge Configurations ------------------------------------------------

""" TreeSitter Configurations -------------------------------------------------
"" Enable tree sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
     ensure_installed = "maintained",
     highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = true,
     },
     refactor = {
          highlight_definitions = { enable = true },
          smart_rename = {
               enable = true,
               keymaps = {
                    smart_rename = "grr",
               },
          },
          navigation = {
               enable = true,
               keymaps = {
                    goto_definition = "gnd",
                    list_definitions = "gnD",
               },
          },
     },
}

-- Fix rainbow paretheses
require"nvim-treesitter.highlight"
local hlmap = vim.treesitter.highlighter.hl_map
hlmap.error = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = nil
EOF
""" End of TreeSitter ---------------------------------------------------------

""" Instant Settings-----------------------------------------------------------
let g:instant_username = trim(system('whoami'))

function StartInstantSession()
    let port = input('Server Port: ')
    silent execute('InstantStartServer 0.0.0.0 ' . port)
    silent execute('InstantStartSession 0.0.0.0 ' . port)
    execute('InstantStatus')
endfunction

function JoinInstantSession()
    let host = input('Server Host to connect: ')
    let port = input('Server Port to connect: ')
    silent execute('InstantJoinSession ' . host . ' ' . port)
    execute('InstantStatus')
endfunction

function StopInstantSession()
    silent execute('InstantStop')
    execute('InstantStatus')
endfunction

function StopInstantServer()
    silent execute('InstantStopServer')
    execute('InstantStatus')
endfunction

nmap <leader>Is :call StartInstantSession()<CR>
nmap <leader>Ij :call JoinInstantSession()<CR>
nmap <leader>Iq :call StopInstantSession()<CR>
nmap <leader>IQ :call StopInstantServer()<CR>
""" End of Instant  -----------------------------------------------------------


""" Neoformat Settings --------------------------------------------------------
"" Mappings
" Format code
nnoremap <silent> g= :Neoformat <CR>

"" Settings
" Clang-format
let g:neoformat_c_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100}"']
\}
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100}"']
\}

" Yapf
let g:neoformat_python_yapf = {
    \ 'exe': 'yapf',
    \ 'args': ['--style="{column_limit: 100}"']
\}

" Prettier
let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin-filepath', '"%:p"', '--tab-width=4', '--print-width=100'],
    \ 'stdin': 1,
\}

let g:neoformat_vue_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin-filepath', '"%:p"', '--tab-width=4', '--print-width=100', '--vue-indent-script-and-style'],
    \ 'stdin': 1,
\}
""" End of Neoformat Settings -------------------------------------------------


""" Tex Conceal Setings -------------------------------------------------------
set conceallevel=2
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1
highlight clear Conceal
""" End of Tex Conceal Setings ------------------------------------------------


""" Vanilla Terminal Support --------------------------------------------------
"" Mappings
" Spawn shell \s
nmap <leader>s :call StartShell()<CR> i

"" Settings
augroup term_nonumber
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber                        " Set no number when opening terminal
augroup END
" Allow better window switching in terminal mode
augroup vimrc_term
    autocmd!
    autocmd WinEnter term://* nohlsearch
    autocmd WinEnter term://* startinsert
    autocmd TermOpen * setlocal listchars= | set nocursorline | set nocursorcolumn
    autocmd TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
    autocmd TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
    autocmd TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
    autocmd TermOpen * tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
    autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
augroup END

"" Functions
function StartShell()
    set shell=/bin/zsh
    silent execute('vsp')
    silent execute('term')
endfunction
""" End Of Vanilla Terminal Support ------------------------------------------


""" Vanilla Transparent Mode -------------------------------------------------
"" Mappings
" Activate Transparent mode    \T
nmap <leader>T :call ToggleTransparentMode()<CR>

"" Functions
let s:transparent = 0
function ToggleTransparentMode()
    if s:transparent
        colorscheme space-vim-dark
        highlight clear Comment
        highlight Comment cterm=italic ctermfg=8
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
        silent execute("norm \<C-h>")
        silent execute('vertical resize +6')
        silent execute('NERDTreeToggle')
        silent execute("norm \<C-j>")
        augroup stop_insertmode
            autocmd!
            autocmd WinEnter * stopinsert
        augroup END
        silent execute('q')
        let s:ide = 0
    else
        silent execute('NERDTreeToggle')
        silent execute('vertical resize -6')
        silent execute("norm \<C-l>")
        silent execute('sp')
        silent execute('resize -10')
        silent execute('term')
        augroup start_insertmode
            autocmd!
            autocmd WinEnter term://* startinsert
        augroup END
        silent execute("norm \<C-k>")
        let s:ide = 1
    endif
endfunction
""" End Of Vanilla IDE Mode ---------------------------------------------------
