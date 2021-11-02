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
Plug 'Pocco81/Catppuccino.nvim'                                         " Syntax highlighting with treesitter integration
" User Interface
Plug 'kyazdani42/nvim-web-devicons'                                     " Allows for nerdfont icons to be displayed
Plug 'mhinz/vim-startify'                                               " Better startup screen for vim
Plug 'p00f/nvim-ts-rainbow'                                             " Rainbow parenthesis in lua
Plug 'nvim-lualine/lualine.nvim'                                        " Status line written in lua
" Syntax highlighting
Plug 'machakann/vim-highlightedyank'                                    " Higlighting yanked text
Plug 'norcalli/nvim-colorizer.lua'                                      " Colour for hex colour codes
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdateSync all'}    " Better syntax parser
Plug 'nvim-treesitter/nvim-treesitter-refactor'                         " Better highlighting tool

"" Functionalities
" Git
Plug 'lewis6991/gitsigns.nvim'                                          " Better gitgutter
" File finding
Plug 'junegunn/fzf.vim'                                                 " Fuzzy finder for vim
Plug 'ms-jpq/chadtree', {'branch': 'chad',
            \ 'do': 'python3 -m chadtree deps --nvim',
            \ 'on': 'CHADopen'}                                         " Fast file finder
" Auto-completion
Plug 'neovim/nvim-lspconfig'                                            " Neovim native lsp client
Plug 'kabouzeid/nvim-lspinstall'                                        " LSP server installer
Plug 'tami5/lspsaga.nvim', {'branch': 'nvim51'}                         " LSP extras
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}                    " Snippets for coq
Plug 'ms-jpq/coq_nvim', {'branch': 'coq', 'do': 'python3 -m coq deps'}  " Very fast autocompletion
" Debugger
Plug 'mfussenegger/nvim-dap'                                            " Debug adapter protocol
Plug 'rcarriga/nvim-dap-ui'                                             " TUI for DAP
Plug 'theHamsta/nvim-dap-virtual-text'                                  " Displays variable informations
Plug 'Pocco81/DAPInstall.nvim'                                          " Package manager for debuggers
"More efficient (lazy) plugins
Plug 'abecodes/tabout.nvim'                                             " Tabout faster from quotes or parenthesis
Plug 'anyakichi/vim-surround'                                           " Surround highlighted text easier
Plug 'liuchengxu/vim-which-key'                                         " Dictionary of features
Plug 'mg979/vim-visual-multi', {'branch': 'master'}                     " Sublime-styled multiple cursors support
Plug 'preservim/nerdcommenter'                                          " Easy commenting
Plug 'windwp/nvim-autopairs'                                            " Automatically pair parenthesis and more
" Misc
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}                    " Nicer unicode for conceal
Plug 'andweeb/presence.nvim'                                            " Flex on dem vscode plebs with discord rich presence
Plug 'hkupty/iron.nvim'                                                 " REPL for programming
Plug 'lewis6991/impatient.nvim'                                         " Lua caching for performance
Plug 'jbyuki/instant.nvim',
            \ {'on': ['InstantStartServer', 'InstantJoinSession']}      " Peer pair programming
Plug 'kkoomen/vim-doge', {'do': './scripts/install.sh',
            \ 'on': 'DogeGenerate'}                                     " Documentation Generator
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'markdown', 'jsx']}     " Quick way to generatre html
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                        " Undo visualiser
Plug 'mhartington/formatter.nvim'                                       " Auto formatter
Plug 'vim-scripts/LargeFile'                                            " Edit large files quickly

"" Dependencies
Plug 'nvim-lua/plenary.nvim'                                            " Some library
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}                      " Fuzzy finder

call plug#end()

let g:brew_path = '/usr/local'
if !empty(glob('/opt/homebrew'))
    let g:brew_path = '/opt/homebrew'
endif

let g:python3_host_prog = g:brew_path . '/bin/python3'
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
set termguicolors
lua <<EOF
-- Catppuccino
vim.g.transparent = true

local catppuccino = require("catppuccino")
catppuccino.setup({
    colorscheme = 'soft_manilo',
    transparency = vim.g.transparent,
    integrations = {
        lsp_saga = true,
        gitgutter = true,
    },
})

function transparency()
    vim.g.transparent = not vim.g.transparent
    catppuccino.setup({transparency = vim.g.transparent})
    vim.cmd("colorscheme catppuccino")
end

-- Colorizer
require'colorizer'.setup()
EOF

command Transparency lua transparency()
nnoremap <silent><Leader>T :Transparency<CR>
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
set updatetime=50
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
highlight HighlightedyankRegion gui=reverse

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
        lualine_b = {'branch', 'diff'},
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
                    hint = {bg = "#222424", fg = "#dbc074"},
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


"" CHADTree Configurations ---------------------------------------------------
"" Mappings
" Activate CHADTree    Ctrl-o
nmap <C-o> :CHADopen<CR>

" Open directories with chadtree instead of netrw
augroup Chad
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
        \ exe 'CHADopen' | wincmd p | ene | exe 'cd '.argv()[0] | endif
augroup END
""" End Of CHADTree Configurations --------------------------------------------


""" FZF Configurations --------------------------------------------------------
"" Settings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Constant', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs -g '!.git/*'"

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let $BAT_THEME = 'TwoDark'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"" Mappings
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent><C-g> :RG<CR>
""" End Of FZF Configurations -------------------------------------------------


""" LSP Configurations --------------------------------------------------------
"" Colours
highlight Pmenu ctermfg=247 ctermbg=235
highlight PmenuSel ctermfg=0 ctermbg=13
highlight LspDiagnosticsDefaultError ctermfg=9
highlight LspDiagnosticsDefaultWarning ctermfg=3

" LSP settings
lua <<EOF
vim.g.coq_settings = {
    auto_start = 'shut-up',
    clients = {
        tabnine = {
            enabled = true,
        },
    },
    keymap = {
        recommended = false,
        jump_to_mark = '<c-x>',
    },
}

local lspconfig = require'lspconfig'
local coq = require'coq'
local lspinstall = require'lspinstall'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspinstall.setup()
local servers = lspinstall.installed_servers()

for _, server in pairs(servers) do
    local config = {
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
        root_dir = lspconfig.util.path.dirname,
    }

    if server == 'latex' then
        config.settings = { texlab = { build = {
            args = { "-halt-on-error", "%f" },
            executable = "pdflatex",
            onSave = true,
        }, }, }
    end

    lspconfig[server].setup(coq.lsp_ensure_capabilities(config))
end

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

nnoremap <silent>gd :Lspsaga preview_definition<CR>
nnoremap <silent>gh :Lspsaga hover_doc<CR>
nnoremap <silent>gf :Lspsaga lsp_finder<CR>
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent>gc :Lspsaga code_action<CR>
""" End Of LSP Configurations -------------------------------------------------


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
lua <<EOF
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false })

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
        return npairs.esc('<c-y>')
    else
        return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
    else
        return npairs.autopairs_cr()
    end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
        return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
EOF
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
set foldenable!
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
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
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            '#cf637e',
            '#f4a261',
            '#dbc074',
            '#aace8d',
            '#73d2d4',
            '#90c7f4',
            '#d59ee6',
        },
    },
}
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


""" Format Settings -----------------------------------------------------------
"" Mappings
" Format code
nnoremap <silent> g= :Format <CR>

"" Settings
lua <<EOF
local clang_format = {
    function()
        return {
            exe = 'clang-format',
            args = {
                '--style', '"{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100}"',
                '--assume-filename', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
            cwd = vim.fn.expand('%:p:h'),
        }
    end
}

local prettier = {
    function()
        return {
            exe = 'prettier',
            args = {
                '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                '--tab-width=4', '--print-width=100',
            },
            stdin = true,
        }
    end
}

local yapf = {
    function()
        return {
            exe = 'yapf',
            args = {
                '--style', '"{column_limit:100}"',
                vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
        }
    end
}

require('formatter').setup({
    filetype = {
        c = clang_format,
        cpp = clang_format,
        java = clang_format,
        javascript = prettier,
        html = prettier,
        css = prettier,
        json = prettier,
        yaml = prettier,
        jsx = prettier,
        python = yapf,
    },
})
EOF
""" End of format Settings ----------------------------------------------------


""" Tex Conceal Setings -------------------------------------------------------
set conceallevel=2
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1
highlight clear Conceal
""" End of Tex Conceal Setings ------------------------------------------------


""" Terminal Settings ---------------------------------------------------------
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
augroup END
""" End of Terminal Settings --------------------------------------------------

lua <<EOF
-- Tabout
require'tabout'.setup()

-- Discord Rich Presence
require("presence"):setup({ enable_line_number = true })

-- Gitsigns
require('gitsigns').setup{
    signs = {
        delete = { text = '│' },
        topdelete = { text = '│' },
        changedelete = { text = '│' },
    },
    numhl = true,
}

vim.api.nvim_set_keymap('n', '<Leader>hd', '[[<cmd>lua require("gitsigns").diffthis()<CR>]]', { noremap = true, silent = true })

local dap_install = require("dap-install")
for _, debugger in ipairs(require("dap-install.api.debuggers").get_installed_debuggers()) do
    dap_install.config(debugger)
end

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = vim.g.brew_path .. '/opt/llvm/bin/lldb-vscode',
    name = 'lldb',
}

dap.configurations.cpp = {{
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
}}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


require'nvim-dap-virtual-text'.setup()

require("dapui").setup()

-- Iron REPL
local pythonrepl = 'python'
if vim.api.nvim_call_function('executable', {'ipython'}) == 1 then
    pythonrepl = 'ipython'
end

require'iron'.core.set_config {
    repl_open_cmd = "botright 15 split",
    preferred = {
        python = pythonrepl,
    },
}

vim.g.iron_map_defaults = 0
vim.g.iron_map_extended = 0

vim.api.nvim_set_keymap('v', 'is', '<Plug>(iron-visual-send)', {})
EOF
command DAPContinue lua require'dap'.continue()
command DAPTBreakpoint lua require'dap'.toggle_breakpoint()
command DAPStepOver lua require'dap'.step_over()
command DAPStepInto lua require'dap'.step_into()
command DAPStepOut lua require'dap'.step_out()
command DAPRepl lua require'dap'.repl.open()
command DAPDisconnect lua require'dapui'.disconnect()
command DAPClose lua require'dap'.close()
command DAPUIToggle lua require'dapui'.toggle()
command DAPUIEval lua require'dapui'.eval()

nnoremap <silent> <F5> :DAPContinue<CR>
nnoremap <silent> <F6> :DAPTBreakpoint<CR>
nnoremap <silent> <F10> :DAPStepOver<CR>
nnoremap <silent> <F11> :DAPStepInto<CR>
nnoremap <silent> <F12> :DAPStepOut<CR>
nnoremap <silent> <leader>dc :DAPClose<CR>
nnoremap <silent> <leader>dr :DAPRepl<CR>
nnoremap <silent> <leader>du :DAPUIToggle<CR>
nnoremap <silent> <leader>de :DAPUIEval<CR>

let g:maplocalleader = ','
nnoremap <silent> <localleader> :silent WhichKey ','<CR>
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0
let g:which_key_map = {}

highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map.D = [':DogeGenerate','Generate docs']
let g:which_key_map.F = [':Neoformat','Format code']
let g:which_key_map.T = [':Transparency','Toggle Transparency']
let g:which_key_map.o = [':CHADopen','File Explorer']
let g:which_key_map.t = [':Lspsaga open_floaterm','Open terminal']
let g:which_key_map.u = [':UndotreeToggle','Toggle UndoTree']

let g:which_key_map.d = {
    \ 'name' : '+Debugger',
    \ 'C' : [':DAPClose', 'Close'],
    \ 'D' : [':DAPDisconnect', 'Disconnect'],
    \ 'R' : [':DAPRepl', 'Repl'],
    \ 'S' : [':DAPStepInto', 'Step into'],
    \ 'b' : [':DAPTBreakpoint', 'Toggle breakpoint'],
    \ 'c' : [':DAPContinue','Continue'],
    \ 'e' : [':DAPUIEval', 'Evaluate'],
    \ 'o' : [':DAPStepOut', 'Step out'],
    \ 's' : [':DAPStepOver', 'Step over'],
    \ 'u' : [':DAPUIToggle', 'Open Ui'],
    \ }

let g:which_key_map.f = {
    \ 'name' : '+FZF',
    \ '/' : [':BLines','Lines in buffer'],
    \ 'C' : [':Commits','Commits'],
    \ 'G' : [':GFiles?','Git status files'],
    \ 'H' : [':History/','Search history'],
    \ 'M' : [':Maps','Mappings'],
    \ '\' : [':Lines','Lines'],
    \ 'b' : [':Buffers','Buffers'],
    \ 'c' : [':BCommits','Commits for buffer'],
    \ 'f' : [':Files','Files'],
    \ 'g' : [':GFiles','Git files'],
    \ 'h' : [':History:','Command history'],
    \ 'm' : [':Marks','Marks'],
    \ 'r' : [':RG','Ripgrep'],
    \ }

let g:which_key_map.g = {
    \ 'name' : '+Git' ,
    \ 'R' : [':Gitsigns reset_buffer','Reset buffer'],
    \ 'S' : [':Gitsigns stage_hunk','Stage hunk'],
    \ 'U' : [':Gitsigns reset_buffer_index','Reset buffer index'],
    \ '[' : [':Gitsigns prev_hunk','Previous hunk'],
    \ ']' : [':Gitsigns next_hunk','Next hunk'],
    \ 'b' : [':Gitsigns blame_line','Blame line'],
    \ 'd' : [':Gitsigns diffthis','Reset buffer index'],
    \ 'p' : [':Gitsigns preview_hunk','Preview hunk'],
    \ 'r' : [':Gitsigns reset_hunk','Reset hunk'],
    \ 's' : [':Gitsigns stage_buffer','Stage buffer'],
    \ 'u' : [':Gitsigns undo_stage_hunk','Undo stage hunk'],
    \ }

let g:which_key_map.l = {
    \ 'name' : '+LSPSaga' ,
    \ 'D' : [':Lspsaga show_line_diagnostics','Show line diagnostics'],
    \ 'c' : [':Lspsaga code_action','Code action'],
    \ 'd' : [':Lspsaga show_cursor_diagnostics','Show cursor diagnostics'],
    \ 'f' : [':Lspsaga lsp_finder','Find reference'],
    \ 'h' : [':Lspsaga hover_doc','Docs'],
    \ 'i' : [':LspInfo','LSP info'],
    \ 'p' : [':Lspsaga preview_definition','Preview definition'],
    \ 'r' : [':Lspsaga rename','Rename variable'],
    \ 's' : [':Lspsaga signature_help','Show signature'],
    \ }

let g:which_key_map.r = {
    \ 'name': '+REPL',
    \ 'C': [':IronReplHere', 'Create REPL in same pane'],
    \ 'c': [':IronRepl', 'Create REPL'],
    \ 'f': [':IronFocus', 'Focus'],
    \ 'i': ['<Plug>(iron-interrupt)', 'Interrupt REPL'],
    \ 'l': ['<Plug>(iron-clear)', 'Clear REPL'],
    \ 'q': ['<Plug>(iron-exit)', 'Quit REPL'],
    \ 'r': [':IronRestart', 'Restart REPL'],
    \ }
" Register which key map
call which_key#register(',', "g:which_key_map")
