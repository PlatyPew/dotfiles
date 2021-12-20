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
Plug 'Pocco81/Catppuccino.nvim', {'branch': 'old-catppuccino'}          " Syntax highlighting with treesitter integration
" User Interface
Plug 'glepnir/dashboard-nvim'                                               " Better startup screen for vim
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
Plug 'ibhagwan/fzf-lua'
Plug 'ms-jpq/chadtree', {'branch': 'chad',
            \ 'do': 'python3 -m chadtree deps --nvim',
            \ 'on': 'CHADopen'}                                         " Fast file finder
" Auto-completion
Plug 'neovim/nvim-lspconfig'                                            " Neovim native lsp client
Plug 'williamboman/nvim-lsp-installer'                                  " LSP server installer
Plug 'tami5/lspsaga.nvim'                                               " LSP extras
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}                    " Snippets for coq
Plug 'ms-jpq/coq_nvim', {'branch': 'coq', 'do': 'python3 -m coq deps'}  " Very fast autocompletion
Plug 'jameshiew/nvim-magic'
" Debugger
Plug 'mfussenegger/nvim-dap'                                            " Debug adapter protocol
Plug 'rcarriga/nvim-dap-ui'                                             " TUI for DAP
Plug 'theHamsta/nvim-dap-virtual-text'                                  " Displays variable informations
Plug 'Pocco81/DAPInstall.nvim'                                          " Package manager for debuggers
"More efficient (lazy) plugins
Plug 'anyakichi/vim-surround'                                           " Surround highlighted text easier
Plug 'liuchengxu/vim-which-key'                                         " Dictionary of features
Plug 'mg979/vim-visual-multi', {'branch': 'master'}                     " Sublime-styled multiple cursors support
Plug 'phaazon/hop.nvim'
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
Plug 'mattn/emmet-vim',
            \ {'for': ['html', 'css', 'markdown', 'javascriptreact']}   " Quick way to generatre html
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                        " Undo visualiser
Plug 'mhartington/formatter.nvim'                                       " Auto formatter
Plug 'vim-scripts/LargeFile'                                            " Edit large files quickly

"" Dependencies
Plug 'kyazdani42/nvim-web-devicons'                                     " Allows for nerdfont icons to be displayed
Plug 'nvim-lua/plenary.nvim'                                            " Some library
Plug 'vijaymarupudi/nvim-fzf'
Plug 'MunifTanjim/nui.nvim'

call plug#end()

let g:python3_host_prog = $DOTFILES . '/configs/neovim/venv/bin/python3'
""" End Of Vim-Plug -----------------------------------------------------------


lua <<EOF
local remap = vim.api.nvim_set_keymap
-- Optimisation
require('impatient') -- Lua cache loading
vim.o.foldmethod = 'expr'
vim.o.lazyredraw = true
vim.o.ruler = false


-- Plugin Colouring
vim.o.termguicolors = true
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

vim.cmd "command Transparency lua transparency()"

remap('n', '<Leader>T', [[ <Cmd>Transparency<CR> ]], {noremap = true, silent = true})


-- Vanilla Configurations
vim.cmd [[
    syntax on
    colorscheme catppuccino
    highlight ColorColumn guifg=#d84652 guibg=#000000

    augroup highlights
        autocmd!
        autocmd Filetype * if &ft!="dashboard" && &ft!="" | call matchadd('ColorColumn', '\%101v[^\n]')
        autocmd FileType text,markdown,tex setlocal spell
        autocmd FileType text,markdown,tex highlight clear ColorColumn
    augroup END
]]

vim.o.cursorline = true
vim.o.encoding = 'utf-8'
vim.o.expandtab = true
vim.o.list = true
vim.o.listchars = 'tab:»·,trail:·,nbsp:·'
vim.o.showmode = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.spelllang = 'en_gb'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.updatetime = 50
vim.o.whichwrap = 'b,s,<,>,h,l'
vim.o.wrap = true

vim.g.tex_flavor = 'latex'
vim.g.clipboard = {
    name = "pbcopy",
    copy = {
        ["*"] = "pbcopy",
        ["+"] = "pbcopy"
    },
    paste = {
        ["*"] = "pbpaste",
        ["+"] = "pbpaste"
    },
    cache_enabled = 0,
}


-- Vanilla Rebindings
-- Rebinds arrow keys to increase/decrease size of pane while in normal/visual mode
-- Increase horizontal split
remap('n', '<Up>', [[ <Cmd>resize +2<CR> ]], {noremap = true, silent = true})
remap('v', '<Up>', [[ <Cmd>resize +2<CR> ]], {noremap = true, silent = true})

-- Decrease horizontal split
remap('n', '<Down>', [[ <Cmd>resize -2<CR> ]], {noremap = true, silent = true})
remap('v', '<Down>', [[ <Cmd>resize -2<CR> ]], {noremap = true, silent = true})

-- Decrease vertical split
remap('n', '<Left>', [[ <Cmd>vertical resize -2<CR> ]], {noremap = true, silent = true})
remap('v', '<Left>', [[ <Cmd>vertical resize -2<CR> ]], {noremap = true, silent = true})

-- Increase vertical split
remap('n', '<Right>', [[ <Cmd>vertical resize +2<CR> ]], {noremap = true, silent = true})
remap('v', '<Right>', [[ <Cmd>vertical resize +2<CR> ]], {noremap = true, silent = true})

-- Better window switching
-- Move to pane on the left      Ctrl-h
remap('n', '<C-h>', '<C-w>h', {})
-- Move to lower pane            Ctrl-j
remap('n', '<C-j>', '<C-w>j', {})
-- Move to upper pane            Ctrl-j
remap('n', '<C-k>', '<C-w>k', {})
-- Move to pane on the right     Ctrl-h
remap('n', '<C-l>', '<C-w>l', {})

-- Remap semicolon to colon
remap('n', ';', ':', {noremap = true})

-- Lazy colon, {noremap = true
remap('n', ';', ':', {noremap = true})

-- Cycling buffers
remap('n', '<Leader>bh', [[ <Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bfirst<CR><CR> ]], {noremap = true})
remap('n', '<Leader>bj', [[ <Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR><CR> ]], {noremap = true})
remap('n', '<Leader>bk', [[ <Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR><CR> ]], {noremap = true})
remap('n', '<Leader>bl', [[ <Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:blast<CR><CR> ]], {noremap = true})
remap('n', '<Leader>bq', [[ <Cmd>bdelete<CR> ]], {noremap = true})

-- Stops cursor from flying everywhere
remap('n', 'n', 'nzzzv', {noremap = true})
remap('n', 'N', 'Nzzzv', {noremap = true})

-- Better undo breakpoints
remap('i', ',', ',<C-g>u', {noremap = true})
remap('i', '.', '.<C-g>u', {noremap = true})

-- Move stuff in visual mode
remap('v', 'J', [[ :m '>+1'<CR>gv=gv ]], {noremap = true})
remap('v', 'K', [[ :m '<-2'<CR>gv=gv ]], {noremap = true})


-- Dashboard Configurations
vim.g.dashboard_custom_header = {
    '          ▀████▀▄▄              ▄█ ',
    '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
    '    ▄        █          ▀▀▀▀▄  ▄▀  ',
    '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
    '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
    '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
    '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
    '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
    '   █   █  █      ▄▄           ▄▀   ',
    '                                   ',
    '               PikaVim             ',
}

vim.g.dashboard_custom_section = {
    a = {
      description = {'  New File              :enew'},
      command = ':enew' },
    b = {
      description = {'  Find files            <C-p>'},
      command = ':FzfLua files cmd=rg\\ --files\\ --hidden\\ --no-ignore-vcs\\ -g\\ "!.git/*"' },
    c = {
      description = {'  Find Word             <C-g>'},
      command = ':FzfLua live_grep' },
    d = {
      description = {'  Find Marks              ,fm'},
      command = ':FzfLua marks' },
    e = {
      description = {'  Transparency          <\\-T>'},
      command = ':Transparency' },
    f = {
      description = {'  File Explorer         <C-o>'},
      command = ':CHADopen' },
    g = {
        description = {'  Exit                     :q'},
        command = ':q' },
}


-- Highlighted Yank Configurations
-- Colours
vim.cmd "highlight HighlightedyankRegion gui=reverse"
-- Settings
vim.g.highlightedyank_highlight_duration = -1


-- Lualine Configurations
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
                sources = { 'nvim_diagnostic' },
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
                padding = 1,
            }
        },
        lualine_y = {function () return [[buffers]] end}
    },
    extensions = {'chadtree'},
}


-- Chadtree Configurations
-- Activate CHADTree    Ctrl-o
remap('n', '<C-o>', [[ <Cmd>CHADopen<CR> ]], {noremap = true })

-- Open directories with chadtree instead of netrw
vim.cmd [[
    augroup Chad
        autocmd!
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CHADopen' | wincmd p | ene | exe 'cd '.argv()[0] | endif
    augroup END
]]

require'fzf-lua'.setup{
    winopts = {
        preview = {
            scrollbar = false,
            wrap = 'wrap',
        },
    },
}


-- Fzf Configurations
vim.api.nvim_set_keymap('n', '<C-p>',
    "<cmd>lua require('fzf-lua').files({cmd='rg --files --hidden --no-ignore-vcs -g \"!.git/*\"'})<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-g>',
    "<cmd>lua require('fzf-lua').live_grep_native()<CR>",
    { noremap = true, silent = true })


-- LSP Configurations
-- Colours
vim.cmd [[
    highlight Pmenu ctermfg=247 ctermbg=235
    highlight PmenuSel ctermfg=0 ctermbg=13
    highlight LspDiagnosticsDefaultError ctermfg=9
    highlight LspDiagnosticsDefaultWarning ctermfg=3
]]

-- Settings
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
local lspinstall = require'nvim-lsp-installer'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspinstall.on_server_ready(function(server)
    local config = {
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
        root_dir = lspconfig.util.path.dirname,
    }

    if server.name == 'texlab' then
        config.settings = { texlab = { build = {
            args = { "-halt-on-error", "%f" },
            executable = "pdflatex",
            onSave = true,
        }, }, }
    elseif server.name == 'html' or server.name == 'emmet_ls' then
        config.filetypes = { 'html', 'css', 'javascriptreact' }
    end

    server:setup(coq.lsp_ensure_capabilities(config))
end)

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

remap('n', 'gd', [[ <Cmd>Lspsaga preview_definition<CR> ]], {noremap = true, silent = true })
remap('n', 'gh', [[ <Cmd>Lspsaga hover_doc<CR> ]], {noremap = true, silent = true })
remap('n', 'gf', [[ <Cmd>Lspsaga lsp_finder<CR> ]], {noremap = true, silent = true })
remap('n', 'gr', [[ <Cmd>Lspsaga rename<CR> ]], {noremap = true, silent = true })
remap('n', 'gc', [[ <Cmd>Lspsaga code_action<CR> ]], {noremap = true, silent = true })


-- Autopairs Configurations
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


-- UndoTree Configurations
remap('n', '<Tab>', [[ <Cmd>UndotreeToggle<CR> ]], {})
-- Loads persistent undo tree to ~/.cache
vim.cmd [[
    if has('persistent_undo')
        set undodir=~/.cache/nvim/undotree
        set undofile
    endif
]]


-- Nerd Commenter Configurations
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDAltDelims_java = 1
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDToggleCheckAllLines = 1
vim.g.NERDCustomDelimiters = {
    python = {
        left = "#",
        right = ""
    },
}


-- Doge Configurations
vim.g.doge_mapping = '<Leader>K'
vim.g.doge_doc_standard_c = 'kernel_doc'


-- TreeSitter Configurations
vim.o.foldenable = false
vim.o.foldlevel = 20
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

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

vim.cmd "highlight TSDefinitionUsage gui=underline"
EOF


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
        javascriptreact = prettier,
        json = prettier,
        yaml = prettier,
        jsx = prettier,
        python = yapf,
    },
})
EOF
""" End of format Settings ----------------------------------------------------


""" Tex Conceal Setings -------------------------------------------------------
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

require('nvim-magic').setup()

local dap_install = require("dap-install")
for _, debugger in ipairs(require("dap-install.api.debuggers").get_installed_debuggers()) do
    dap_install.config(debugger)
end

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = 'lldb-vscode',
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

require'hop'.setup()
vim.api.nvim_set_keymap('n', '<Leader><Leader>w', ":HopWordAC<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>b', ":HopWordBC<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>j', ":HopLineStartAC<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>k', ":HopLineStartBC<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>1', ":HopChar1<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>2', ":HopChar2<CR>", {silent=true})
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
    \ '/' : [':FzfLua blines','Lines in buffer'],
    \ 'C' : [':FzfLua git_commits','Commits'],
    \ 'G' : [':FzfLua git_status','Git status files'],
    \ 'M' : [':FzfLua keymaps','Mappings'],
    \ 'b' : [':FzfLua buffers','Buffers'],
    \ 'c' : [':FzfLua git_bcommits','Commits for buffer'],
    \ 'f' : [':FzfLua files cmd=rg\ --files\ --hidden\ --no-ignore-vcs\ -g\ "!.git/*"','Files'],
    \ 'g' : [':FzfLua git_files','Git files'],
    \ 'h' : [':FzfLua command_history','Command history'],
    \ 'm' : [':FzfLua marks','Marks'],
    \ 'r' : [':FzfLua live_grep','Ripgrep'],
    \ 's' : [':FzfLua spell_suggest','Spell suggest'],
    \ }

let g:which_key_map.g = {
    \ 'name' : '+Git' ,
    \ 'R' : [':Gitsigns reset_buffer','Reset buffer'],
    \ 'S' : [':Gitsigns stage_buffer','Stage buffer'],
    \ 'U' : [':Gitsigns reset_buffer_index','Reset buffer index'],
    \ '[' : [':Gitsigns prev_hunk','Previous hunk'],
    \ ']' : [':Gitsigns next_hunk','Next hunk'],
    \ 'b' : [':Gitsigns blame_line','Blame line'],
    \ 'd' : [':Gitsigns diffthis','Reset buffer index'],
    \ 'p' : [':Gitsigns preview_hunk','Preview hunk'],
    \ 'r' : [':Gitsigns reset_hunk','Reset hunk'],
    \ 's' : [':Gitsigns stage_hunk','Stage hunk'],
    \ 'u' : [':Gitsigns undo_stage_hunk','Undo stage hunk'],
    \ }

let g:which_key_map.l = {
    \ 'name' : '+LSP' ,
    \ 'D' : [':Lspsaga show_line_diagnostics','Show line diagnostics'],
    \ 'I' : [':LspInstallInfo','LSP Installer'],
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
