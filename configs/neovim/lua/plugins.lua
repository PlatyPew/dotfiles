vim.g.python3_host_prog = vim.fn.getenv("DOTFILES") .. "/configs/neovim/venv/bin/python3"

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd("packadd packer.nvim")
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init({
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

local function getConfig(name)
    return string.format("require('config/%s')", name)
end

return packer.startup(function(use)
    use({ "wbthomason/packer.nvim" })

    use({
        "lewis6991/impatient.nvim",
        config = function()
            require("impatient")
        end,
    })

    use({ "nathom/filetype.nvim" })

    use({
        "Pocco81/Catppuccino.nvim",
        branch = "old-catppuccino",
        config = getConfig("catppuccino"),
    })

    use({
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = function()
            require("colorizer").setup()
        end,
    })

    use({
        "nvim-lualine/lualine.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        event = "VimEnter",
        config = getConfig("lualine"),
    })

    use({
        "glepnir/dashboard-nvim",
        requires = {
            {
                "ibhagwan/fzf-lua",
                event = "VimEnter",
                config = function()
                    require("fzf-lua").setup({
                        winopts = {
                            preview = {
                                scrollbar = false,
                                wrap = "wrap",
                            },
                        },
                    })
                end,
            },
            "kyazdani42/nvim-web-devicons",
        },
        after = "Catppuccino.nvim",
        config = getConfig("dashboard"),
    })

    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        cmd = "NvimTreeToggle",
        config = function()
            require("nvim-tree").setup({
                disable_netrw = true,
                hijack_cursor = true,
            })
        end,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate all",
        requires = {
            { "nvim-treesitter/nvim-treesitter-refactor", event = "VimEnter" },
            { "windwp/nvim-ts-autotag", event = "InsertEnter" },
            { "p00f/nvim-ts-rainbow", event = "BufEnter" },
            { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPost" },
            { "yioneko/nvim-yati", event = "BufReadPost" },
            {
                "windwp/nvim-autopairs",
                event = "InsertEnter",
                config = getConfig("autopair"),
            },
        },
        config = getConfig("treesitter"),
    })

    use({
        "machakann/vim-highlightedyank",
        event = "BufReadPost",
        config = function()
            vim.api.nvim_set_hl(0, "HighlightedyankRegion", { reverse = true })
            vim.g.highlightedyank_highlight_duration = -1
        end,
    })

    use({
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        event = "BufReadPost",
        config = getConfig("gitsigns"),
    })

    use({
        "neovim/nvim-lspconfig",
        event = "BufEnter",
        requires = {
            { "williamboman/nvim-lsp-installer", event = "VimEnter" },
            { "tami5/lspsaga.nvim", event = "BufEnter" },
            {
                "ms-jpq/coq_nvim",
                branch = "coq",
                run = "rm -rf .vars && python3 -m coq deps",
                event = "InsertCharPre",
            },
            { "ms-jpq/coq.artifacts", after = "nvim-lspconfig" },
            "ms-jpq/coq.thirdparty",
            {
                "PlatyPew/copilot.vim",
                branch = "removevirt",
                cmd = "Copilot",
            },
        },
        config = getConfig("lsp"),
    })

    use({
        "mfussenegger/nvim-dap",
        requires = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "mfussenegger/nvim-jdtls",
            {
                "Pocco81/dap-buddy.nvim",
                commit = "24923c3819a450a772bb8f675926d530e829665f",
            },
        },
        event = "BufReadPost",
        config = getConfig("dap"),
    })

    use({
        "anyakichi/vim-surround",
        requires = "tpope/vim-repeat",
        event = "BufReadPost",
    })

    use({
        "folke/which-key.nvim",
        event = "VimEnter",
        config = getConfig("whichkey"),
    })

    use({
        "mg979/vim-visual-multi",
        event = "BufReadPost",
    })

    use({
        "numToStr/Comment.nvim",
        event = "BufReadPost",
        requires = "JoosepAlviste/nvim-ts-context-commentstring",
        config = getConfig("comment"),
    })

    use({
        "KeitaNakamura/tex-conceal.vim",
        ft = "tex",
        config = function()
            vim.g.tex_flavor = "latex"
            vim.g.tex_conceal = "abdgm"
            vim.g.tex_conceal_frac = 1
            vim.api.nvim_set_hl(0, "Conceal", {})
        end,
    })

    use({
        "jbyuki/instant.nvim",
        cmd = { "InstantStartServer", "InstantJoinSession" },
        config = function()
            vim.g.instant_username = io.popen("whoami"):read("*a"):sub(0, -2)
        end,
    })

    use({
        "kkoomen/vim-doge",
        run = "./scripts/install.sh",
        cmd = "DogeGenerate",
        config = function()
            vim.g.doge_mapping = "<Leader>K"
            vim.g.doge_doc_standard_c = "kernel_doc"
        end,
    })

    use({
        "mattn/emmet-vim",
        ft = { "html", "css", "markdown", "javascriptreact" },
        event = "InsertCharPre",
    })

    use({ "mbbill/undotree", cmd = "UndotreeToggle" })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = "PlatyPew/format-installer.nvim",
        after = "nvim-lspconfig",
        config = getConfig("nullls"),
    })

    use({ "vim-scripts/LargeFile" })

    use({
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = "cd app && npm install",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    })

    use({
        "michaelb/sniprun",
        run = "bash ./install.sh 1",
        keys = {
            "<Plug>SnipReplMemoryClean",
            "<Plug>SnipReset",
            "<Plug>SnipClose",
            "<Plug>SnipInfo",
            "<Plug>SnipRun",
            "<Plug>SnipTerminate",
        },
        config = function()
            require("sniprun").setup({
                snipruncolors = { SniprunVirtualTextOk = { bg = "#b1e3ad", fg = "#000000" } },
            })
        end,
    })

    local status_ok, packer = pcall(require, "packer_compiled")
    if not status_ok then
        vim.cmd("PackerCompile")
        return
    end

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
