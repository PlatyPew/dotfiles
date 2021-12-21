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
lua <<EOF
-- Packer Configurations
local packer = require("packer")
packer.init{
    enable = true,
    threshold = 0
}

local use = packer.use
packer.reset()

packer.startup(function()
    use 'wbthomason/packer.nvim'

    use { 'Pocco81/Catppuccino.nvim', branch = 'old-catppuccino' }
    use {
        'glepnir/dashboard-nvim',
        requires = {
            'ibhagwan/fzf-lua',
            'kyazdani42/nvim-web-devicons'
        },
    }
    use {
         'ms-jpq/chadtree',
         branch = 'chad',
         run = 'python3 -m chadtree deps --nvim',
         cmd = 'CHADopen',
     }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdateSync all',
        requires = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'p00f/nvim-ts-rainbow',
            'windwp/nvim-autopairs',
        },
    }
    use { 'norcalli/nvim-colorizer.lua' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
    }
    use { 'machakann/vim-highlightedyank' }
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/nvim-lsp-installer',
            'tami5/lspsaga.nvim',
        {
            'ms-jpq/coq_nvim',
            branch = 'coq',
            run = 'python3 -m coq deps',
        },
            { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
        },
    }
    use {
        'jameshiew/nvim-magic',
        requires = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
        },
    }
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'Pocco81/DAPInstall.nvim',
        },
    }
    use { 'anyakichi/vim-surround' }
    use { 'folke/which-key.nvim' }
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use { 'phaazon/hop.nvim' }
    use { 'preservim/nerdcommenter' }
    use { 'KeitaNakamura/tex-conceal.vim', ft = 'text' }
    use { 'andweeb/presence.nvim' }
    use { 'hkupty/iron.nvim' }
    use { 'lewis6991/impatient.nvim' }
    use {
        'jbyuki/instant.nvim',
        cmd = { 'InstantStartServer', 'InstantJoinSession' },
    }
    use {
        'kkoomen/vim-doge',
        run = './scripts/install.sh',
        cmd = 'DogeGenerate',
    }
    use {
        'mattn/emmet-vim',
        ft = { 'html', 'css', 'markdown', 'javascriptreact' },
    }
    use { 'mbbill/undotree', cmd = 'UndotreeToggle' }
    use { 'mhartington/formatter.nvim' }
    use { 'vim-scripts/LargeFile' }
end)


vim.g.python3_host_prog = vim.fn.getenv('DOTFILES') .. '/configs/neovim/venv/bin/python3'
local remap = vim.api.nvim_set_keymap

-- Optimisation
require'impatient' -- Lua cache loading
vim.o.foldmethod = 'expr'
vim.o.lazyredraw = true
vim.o.ruler = false


-- Plugin Colouring
vim.o.termguicolors = true
-- Catppuccino
vim.g.transparent = true

local catppuccino = require'catppuccino'
catppuccino.setup{
    colorscheme = 'soft_manilo',
    transparency = vim.g.transparent,
    integrations = {
        lsp_saga = true,
        gitgutter = true,
    },
}

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
require'lualine'.setup{
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
    "<cmd>lua require'fzf-lua'.files({cmd='rg --files --hidden --no-ignore-vcs -g \"!.git/*\"'})<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-g>',
    "<cmd>lua require'fzf-lua'.live_grep_native()<CR>",
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
local npairs = require'nvim-autopairs'

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

require'nvim-treesitter.configs'.setup{
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


-- Format Configurations
remap('n', 'g=', [[ <Cmd>Format<CR> ]], { noremap = true, silent = true })

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

require'formatter'.setup{
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
}


-- Instant Configurations
vim.g.instant_username = io.popen('whoami'):read('*a'):sub(0, -2)

function InstantStartSession()
    local port = vim.fn.input('Server Port: ')
    vim.api.nvim_exec('InstantStartServer 0.0.0.0 ' .. port, true)
    vim.api.nvim_exec('InstantStartSession 0.0.0.0 ' .. port, true)
    vim.cmd 'InstantStatus'
end

function InstantJoinSession()
    local host = vim.fn.input('Server Host: ')
    local port = vim.fn.input('Server Port: ')
    vim.api.nvim_exec('InstantJoinSession ' .. host .. ' ' .. port , true)
    vim.cmd 'InstantStatus'
end

function InstantStopSession()
    vim.api.nvim_exec('InstantStop')
    vim.cmd 'InstantStatus'
end

function InstantStopServer()
    vim.api.nvim_exec('InstantStopServer')
    vim.cmd 'InstantStatus'
end

remap('n', '<Leader>Is', [[ <Cmd>lua InstantStartSession()<CR> ]], {})
remap('n', '<Leader>Ij', [[ <Cmd>lua InstantJoinSession()<CR> ]], {})
remap('n', '<Leader>Iq', [[ <Cmd>lua InstantStopSession()<CR> ]], {})
remap('n', '<Leader>IQ', [[ <Cmd>lua InstantStopServer()<CR> ]], {})


-- Tex Conceal Configurations
vim.g.tex_conceal = 'abdgm'
vim.g.tex_conceal_frac = 1
vim.cmd 'highlight clear Conceal'


-- Terminal Configurations
vim.cmd [[
    augroup term_nonumber
        autocmd!
        autocmd TermOpen * setlocal nonumber norelativenumber
    augroup END

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
]]


-- Discord Rich Presence Configurations
require"presence":setup{ enable_line_number = true }


-- Gitsigns Configurations
require'gitsigns'.setup{
    signs = {
        delete = { text = '│' },
        topdelete = { text = '│' },
        changedelete = { text = '│' },
    },
    numhl = true,
}

vim.api.nvim_set_keymap('n', '<Leader>hd', '[[<cmd>lua require"gitsigns".diffthis()<CR>]]', { noremap = true, silent = true })


-- Nvim magic Configurations
require'nvim-magic'.setup()


-- Nvim DAP Configurations
local dap_install = require'dap-install'
for _, debugger in ipairs(require("dap-install.api.debuggers").get_installed_debuggers()) do
    dap_install.config(debugger)
end

local dap = require'dap'
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

require'dapui'.setup()

remap('n', '<F5>', [[ <Cmd>lua require'dap'.continue()<CR> ]], { noremap = true, silent = true })
remap('n', '<F6>', [[ <Cmd>lua require'dap'.toggle_breakpoint()<CR> ]], { noremap = true, silent = true })
remap('n', '<F10>', [[ <Cmd>lua require'dap'.step_over()<CR> ]], { noremap = true, silent = true })
remap('n', '<F11>', [[ <Cmd>lua require'dap'.step_into()<CR> ]], { noremap = true, silent = true })
remap('n', '<F12>', [[ <Cmd>lua require'dap'.step_out()<CR> ]], { noremap = true, silent = true })
remap('n', '<Leader>dc', [[ <Cmd>lua require'dap'.close()<CR> ]], { noremap = true, silent = true })
remap('n', '<Leader>dr', [[ <Cmd>lua require'dap'.repl.open()<CR> ]], { noremap = true, silent = true })
remap('n', '<Leader>du', [[ <Cmd>lua require'dapui'.toggle()<CR> ]], { noremap = true, silent = true })
remap('n', '<Leader>de', [[ <Cmd>lua require'dapui'.eval()<CR> ]], { noremap = true, silent = true })


-- Iron REPL Configurations
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


-- Hop Configurations
require'hop'.setup()
vim.api.nvim_set_keymap('n', '<Leader><Leader>w', ":HopWordAC<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>b', ":HopWordBC<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>j', ":HopLineStartAC<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>k', ":HopLineStartBC<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>1', ":HopChar1<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<Leader><Leader>2', ":HopChar2<CR>", {silent=true})


-- WhichKey Configurations
vim.o.timeoutlen = 500
local wk = require'which-key'

wk.setup{
    ignore_missing = true,
}

wk.register({
    D = { '<Cmd>DogeGenerate<CR>', 'Generate docs' },
    F = { '<Cmd>Neoformat<CR>', 'Format code' },
    T = { '<Cmd>Transparency<CR>', 'Toggle Transparency' },
    o = { '<Cmd>CHADopen<CR>', 'File Explorer' },
    u = { '<Cmd>UndotreeToggle<CR>', 'Toggle UndoTree' },

    d = {
        name = 'Debugger',
        C = { "<Cmd>lua require'dap'.close()<CR>", 'Close'},
        D = { "<Cmd>lua require'dapui'.disconnect()<CR>", 'Disconnect'},
        R = { "<Cmd>lua require'dap'.repl.open()<CR>", 'REPL'},
        S = { "<Cmd>lua require'dap'.step_into()<CR>", 'Step Into'},
        b = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", 'Toggle Breakpoint'},
        c = { "<Cmd>lua require'dap'.continue()<CR>", 'Continue'},
        e = { "<Cmd>lua require'dapui'.eval()<CR>", 'Evaluate'},
        o = { "<Cmd>lua require'dap'.step_out()<CR>", 'Step Out'},
        s = { "<Cmd>lua require'dap'.step_over()<CR>", 'Step Over'},
        u = { "<Cmd>lua require'dapui'.toggle()<CR>", 'Open UI'},
    },

    f = {
        name = 'FZF',
        ['/'] = { "<Cmd>lua require'fzf-lua'.blines()<CR>", 'Lines in Buffer' },
        C = { "<Cmd>lua require'fzf-lua'.git_commits()<CR>", 'Commits' },
        G = { "<Cmd>lua require'fzf-lua'.git_status()<CR>", 'Git Status Files' },
        M = { "<Cmd>lua require'fzf-lua'.keymaps()<CR>", 'Mappings' },
        b = { "<Cmd>lua require'fzf-lua'.buffers()<CR>", 'Buffers' },
        c = { "<Cmd>lua require'fzf-lua'.git_bcommits()<CR>", 'Commits for Buffer' },
        f = { "<Cmd>lua require'fzf-lua'.files({cmd='rg --files --hidden --no-ignore-vcs -g \"!.git/*\"'})<CR>", 'Files' },
        g = { "<Cmd>lua require'fzf-lua'.git_files()<CR>", 'Git Files' },
        h = { "<Cmd>lua require'fzf-lua'.command_history()<CR>", 'Command History' },
        m = { "<Cmd>lua require'fzf-lua'.marks()<CR>", 'Marks' },
        r = { "<Cmd>lua require'fzf-lua'.live_grep()<CR>", 'Ripgrep' },
        s = { "<Cmd>lua require'fzf-lua'.spell_suggest()<CR>", 'Spell Suggest' },
    },

    g = {
        name = 'Git',
        R = { '<Cmd>Gitsigns reset_buffer<CR>', 'Reset buffer' },
        S = { '<Cmd>Gitsigns stage_buffer<CR>', 'Stage buffer' },
        U = { '<Cmd>Gitsigns reset_buffer_index<CR>', 'Reset buffer index' },
        ['['] = { '<Cmd>Gitsigns prev_hunk<CR>', 'Previous hunk' },
        [']'] = { '<Cmd>Gitsigns next_hunk<CR>', 'Next hunk' },
        b = { '<Cmd>Gitsigns blame_line<CR>', 'Blame line' },
        d = { '<Cmd>Gitsigns diffthis<CR>', 'Reset buffer index' },
        p = { '<Cmd>Gitsigns preview_hunk<CR>', 'Preview hunk' },
        r = { '<Cmd>Gitsigns reset_hunk<CR>', 'Reset hunk' },
        s = { '<Cmd>Gitsigns stage_hunk<CR>', 'Stage hunk' },
        u = { '<Cmd>Gitsigns undo_stage_hunk<CR>', 'Undo stage hunk' },
    },

    l = {
        name = 'LSP' ,
        D = { '<Cmd>Lspsaga show_line_diagnostics', 'Show line diagnostics' },
        I = { '<Cmd>LspInstallInfo', 'LSP Installer' },
        c = { '<Cmd>Lspsaga code_action', 'Code action' },
        d = { '<Cmd>Lspsaga show_cursor_diagnostics', 'Show cursor diagnostics' },
        f = { '<Cmd>Lspsaga lsp_finder', 'Find reference' },
        h = { '<Cmd>Lspsaga hover_doc', 'Docs' },
        i = { '<Cmd>LspInfo', 'LSP info' },
        p = { '<Cmd>Lspsaga preview_definition', 'Preview definition' },
        r = { '<Cmd>Lspsaga rename', 'Rename variable' },
        s = { '<Cmd>Lspsaga signature_help', 'Show signature' },
    },

    r = {
        name = 'REPL',
        C = { '<Cmd>IronReplHere<CR>', 'Create REPL in same pane' },
        c = { '<Cmd>IronRepl<CR>', 'Create REPL' },
        f = { '<Cmd>IronFocus<CR>', 'Focus' },
        i = { '<Plug>(iron-interrupt)', 'Interrupt REPL' },
        l = { '<Plug>(iron-clear)', 'Clear REPL' },
        q = { '<Plug>(iron-exit)', 'Quit REPL' },
        r = { '<Cmd>IronRestart<CR>', 'Restart REPL' },
    },
}, { mode = 'n', prefix = ',' })

wk.register({
    c = {
        name = 'Comment',
        [' '] = { '<Plug>NERDCommenterToggle', 'Toggle' },
        a = { '<Plug>NERDCommenterAppend', 'Append Comments' },
        c = { '<Plug>NERDCommenterComment', 'Comment' },
        s = { '<Plug>NERDCommenterSexy', 'Sexy Comment' },
        u = { '<Plug>NERDCommenterUncomment', 'Uncomment' },
    },
    m = {
        name = 'Magic',
        a = { '<Plug>nvim-magic-suggest-alteration', 'Alter Completion' },
        c = { '<Plug>nvim-magic-append-completion', 'Append Completion' },
        d = { '<Plug>nvim-magic-suggest-docstring', 'Suggest docstring' },
    },
}, { mode = 'v', prefix = ','})
EOF
