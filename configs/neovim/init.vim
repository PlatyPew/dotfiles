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
Plug 'Pocco81/Catppuccino.nvim'
" User Interface
Plug 'shadmansaleh/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'                                     " Allows for nerdfont icons to be displayed
Plug 'junegunn/rainbow_parentheses.vim', {'on': 'RainbowParentheses!!'} " Adds rainbow colouring for nested parenthesis
Plug 'mhinz/vim-startify'                                               " Better startup screen for vim
Plug 'onsails/lspkind-nvim'
" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate all'}         " Better syntax parser
Plug 'machakann/vim-highlightedyank'

"" Functionalities
" Git
Plug 'airblade/vim-gitgutter'                                           " Shows git diff in vim's gutter
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':CHADdeps'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } , 'on': 'FZF'}        " Fuzzy finder
Plug 'junegunn/fzf.vim'
" Auto-completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jasonrhansen/lspsaga.nvim', {'branch': 'finder-preview-fixes'}
"More efficient (lazy) plugins
Plug 'mg979/vim-visual-multi', {'branch': 'master'}                     " Sublime-styled multiple cursors support
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
Plug 'lewis6991/impatient.nvim'

call plug#end()
""" End Of Vim-Plug -----------------------------------------------------------


""" Optimisation ---------------------------------------------------------------
"" Lua cache loading
lua require('impatient')
set lazyredraw
set ttyfast
set foldmethod=syntax
set foldmethod=expr
set showcmd
set noruler
" set eventignore=all " Ultimate optimisation. Basically no plugins or anything run
""" End Of Optimisation ---------------------------------------------------------


""" Plugin Colouring ----------------------------------------------------------
lua <<EOF
local catppuccino = require("catppuccino")
catppuccino.setup({
    colorscheme = 'soft_manilo',
    transparency = true,
    integrations = {
        lsp_saga = true,
        gitgutter = true,
    },
})
EOF
""" End Of Plugin Colouring ---------------------------------------------------


""" Vanilla Colouring ---------------------------------------------------------
syntax on                                                               " Enable syntax highlighting
" Enable true colours
colorscheme catppuccino
highlight ColorColumn guifg=#d84652 guibg=#000000
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

"" Capital Y now actually makes sense
nnoremap Y yg_

"" Stops cursor from flying everywhere
nnoremap n nzzzv
nnoremap N Nzzzv

"" Better undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u

"" Move stuff in visual mode
vnoremap J :m '>+1'<CR>gv=gv
vnoremap K :m '<-2'<CR>gv=gv
""" End Of Vanilla Rebindings -------------------------------------------------


""" Highlighted Yank Configurations -------------------------------------------
"" Colours
highlight HighlightedyankRegion cterm=reverse

"" Settings
let g:highlightedyank_highlight_duration = -1
""" End Of Highlighted Yank Configurations ------------------------------------


""" Lualine Configurations ----------------------------------------------------
lua <<EOF
require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccino',
        section_separators = {left = '', right = ''},
        component_separators = {left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', {
                'diff',
                colored = false,
            }
        },
        lualine_c = {'filename', 'filesize'},
        lualine_x = {
            'location',
            {
                'filetype',
                colored = true,
            },
        },
        lualine_y = {
            {
                'encoding',
                padding = { left = 1, right = 0 },
            },
            'fileformat',
        },
        lualine_z = {
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    error = {bg = "#222424", fg = "#cf637e"},
                    warn = {bg = "#222424", fg = "#f4a261"},
                    info = {bg = "#222424", fg = "#dbc074"},
                }
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'branch', {
                'diff',
                colored = false,
            }
        },
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                buffers_color = {
                    inactive = {bg = '#44475a', fg = '#ffffff'},
                },
                padding = 0,
            }
        },
        lualine_y = {function () return [[buffers]] end}
    },
    extensions = {'fzf', 'chadtree'},
}
EOF
""" End Of Lualine Configurations ---------------------------------------------


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


""" CHADTree Configurations ---------------------------------------------------
"" Mappings
" Activate CHADTree    Ctrl-o
nmap <C-o> :CHADopen --version-ctl<CR>

" Open directories with chadtree instead of netrw
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'CHADopen' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
""" End Of CHADTree Configurations --------------------------------------------


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
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_confirm_key = ""

" LSP settings
lua <<EOF
local lspconfig = require'lspconfig'
local util = require'lspconfig/util'
local completion = require'completion'

lspconfig.clangd.setup{
    on_attach = completion.on_attach,
    cmd = { "/usr/local/opt/llvm/bin/clangd", "--background-index", "--clang-tidy" },
    flags = { debounce_text_changes = 500 },
}

lspconfig.jedi_language_server.setup{
    on_attach = completion.on_attach,
    cmd = { "jedi-language-server" },
    flags = { debounce_text_changes = 500 },
}

lspconfig.tsserver.setup{
    on_attach = completion.on_attach,
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = util.path.dirname,
    flags = { debounce_text_changes = 500 },
}

lspconfig.bashls.setup{
    on_attach = completion.on_attach,
    cmd = { "bash-language-server", "start" },
    root_dir = util.path.dirname,
    flags = { debounce_text_changes = 500 },
}

lspconfig.texlab.setup{
    on_attach = completion.on_attach,
    cmd = { "texlab" },
    flags = { debounce_text_changes = 500 },
    settings = { texlab = { build = {
        args = { "-halt-on-error", "%f" },
        executable = "pdflatex",
        onSave = true,
    }, }, },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local general_on_attach = function(client, bufnr)
    if client.resolved_capabilities.completion then
        completion.on_attach(client, bufnr)
    end
end

lspconfig.html.setup {
    capabilities = capabilities,
    on_attach = general_on_attach,
    cmd = { "vscode-html-language-server", "--stdio" },
    flags = { debounce_text_changes = 500 },
}

lspconfig.cssls.setup {
    capabilities = capabilities,
    on_attach = general_on_attach,
    cmd = { "vscode-css-language-server", "--stdio" },
    flags = { debounce_text_changes = 500 },
}

require('lspkind').init({
    with_text = true,
    preset = 'default',
})

require'lspsaga'.init_lsp_saga{
    finder_action_keys = {
        open = {'<CR>', 'o'}, quit = {'q', '<esc>', '<C-c>'},
    },
    code_action_keys = {
        quit = {'q', '<esc>', '<C-c>'}
    },
    rename_action_keys = {
        quit = {'<esc>', '<C-c>'}
    },
}
EOF

augroup lspmappings
    autocmd!
    autocmd FileType c,cpp,python,javascript,html,css,sh call SetLSPMappings()
augroup END

function SetLSPMappings()
    nmap <silent>gd :Lspsaga preview_definition<CR>
    nmap <silent>gh :Lspsaga hover_doc<CR>
    nmap <silent>gf :Lspsaga lsp_finder<CR>
    nmap <silent>gr :Lspsaga rename<CR>
    nmap <silent>gc :Lspsaga code_action<CR>
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
    },
    indent = {
        enable = true,
    }
}

-- Fix rainbow paretheses
require"nvim-treesitter.highlight"
local hlmap = vim.treesitter.highlighter.hl_map
hlmap.error = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = nil
EOF

"" Underline definitions
highlight TSDefinitionUsage gui=underline
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
