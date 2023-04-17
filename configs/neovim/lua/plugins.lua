local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

local function getConfig(name)
    return string.format("require('config/%s')", name)
end

return require('lazy').setup({
    {
        "catppuccin/nvim",
        tag = "v0.1",
        config = function()
            require('config/catppuccino')
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        ft = { "html", "css", "markdown", "javascriptreact", "typescriptreact" },
        config = function()
            require("colorizer").setup()
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = function()
            require('config/lualine')
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

    --[[ use({ ]]
    --[[     "glepnir/dashboard-nvim", ]]
    --[[     commit = "a36b3232c98616149784f2ca2654e77caea7a522", ]]
    --[[     requires = { ]]
    --[[         { ]]
    --[[             "ibhagwan/fzf-lua", ]]
    --[[             event = "VimEnter", ]]
    --[[             config = function() ]]
    --[[                 require("fzf-lua").setup({ ]]
    --[[                     winopts = { ]]
    --[[                         preview = { ]]
    --[[                             scrollbar = false, ]]
    --[[                             wrap = "wrap", ]]
    --[[                         }, ]]
    --[[                     }, ]]
    --[[                 }) ]]
    --[[             end, ]]
    --[[         }, ]]
    --[[         "kyazdani42/nvim-web-devicons", ]]
    --[[     }, ]]
    --[[     after = "Catppuccino.nvim", ]]
    --[[     config = getConfig("dashboard"), ]]
    --[[ }) ]]

    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("nvim-tree").setup({
                disable_netrw = true,
                hijack_cursor = true,
            })
        end,
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        }
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        event = 'VimEnter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-refactor',
            'windwp/nvim-ts-autotag',
            'p00f/nvim-ts-rainbow',
            'yioneko/nvim-yati',
            {
                'windwp/nvim-autopairs',
                config = function()
                    require('config/autopair')
                end,
            },
        },
        config = function()
            require('config/treesitter')
        end,
        build = ":TSUpdate",
    },

    {
        "machakann/vim-highlightedyank",
        event = "BufReadPost",
        config = function()
            vim.api.nvim_set_hl(0, "HighlightedyankRegion", { reverse = true })
            vim.g.highlightedyank_highlight_duration = 200
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        config = function()
            require('config/gitsigns')
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
        config = function()
            require('config/lsp')
        end,
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
    },

    {
        -- NOTE: Yes, you can install new plugins here!
        'mfussenegger/nvim-dap',
        -- NOTE: And you can specify dependencies as well
        dependencies = {
            -- Creates a beautiful debugger UI
            'rcarriga/nvim-dap-ui',
            "theHamsta/nvim-dap-virtual-text",

            -- Installs the debug adapters for you
            'williamboman/mason.nvim',
            'jay-babu/mason-nvim-dap.nvim',

            -- Add your own debuggers here
            "mfussenegger/nvim-jdtls",
        },
        config = function()
            require('config/dap')
        end,
    },

    --
    --     use({
    --         "mfussenegger/nvim-dap",
    --         requires = {
    --             "rcarriga/nvim-dap-ui",
    --             "theHamsta/nvim-dap-virtual-text",
    --             "mfussenegger/nvim-jdtls",
    --             {
    --                 "Pocco81/dap-buddy.nvim",
    --                 commit = "24923c3819a450a772bb8f675926d530e829665f",
    --             },
    --         },
    --         event = "BufReadPost",
    --         config = getConfig("dap"),
    --     })

    {
        "anyakichi/vim-surround",
        event = "BufReadPost",
        dependencies = {
            "tpope/vim-repeat",
        },
    },

    {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = getConfig("whichkey"),
    },

    {
        "mg979/vim-visual-multi",
        event = "BufReadPost",
    },

    {
        "numToStr/Comment.nvim",
        event = "BufReadPost",
        config = function()
            require("config/comment")
        end,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    {
        "KeitaNakamura/tex-conceal.vim",
        ft = "tex",
        config = function()
            vim.g.tex_flavor = "latex"
            vim.g.tex_conceal = "abdgm"
            vim.g.tex_conceal_frac = 1
            vim.api.nvim_set_hl(0, "Conceal", {})
        end,
    },

    {
        "jbyuki/instant.nvim",
        cmd = { "InstantStartServer", "InstantJoinSession" },
        config = function()
            vim.g.instant_username = io.popen("whoami"):read("*a"):sub(0, -2)
        end,
    },

    {
        "mattn/emmet-vim",
        ft = { "html", "css", "markdown", "javascriptreact", "typescriptreact" },
        event = "InsertCharPre",
    },

    { "mbbill/undotree",      cmd = "UndotreeToggle" },

    { "vim-scripts/LargeFile" },

    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = "cd app && npm install",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    },

    --[[ use({ ]]
    --[[     "michaelb/sniprun", ]]
    --[[     run = "bash ./install.sh 1", ]]
    --[[     keys = { ]]
    --[[         "<Plug>SnipReplMemoryClean", ]]
    --[[         "<Plug>SnipReset", ]]
    --[[         "<Plug>SnipClose", ]]
    --[[         "<Plug>SnipInfo", ]]
    --[[         "<Plug>SnipRun", ]]
    --[[         "<Plug>SnipTerminate", ]]
    --[[     }, ]]
    --[[     config = function() ]]
    --[[         require("sniprun").setup({ ]]
    --[[             snipruncolors = { SniprunVirtualTextOk = { bg = "#b1e3ad", fg = "#000000" } }, ]]
    --[[         }) ]]
    --[[     end, ]]
    --[[ }) ]]
})
