require("nvim-treesitter.configs").setup({
    autotag = {
        enable = true,
    },
    ensure_installed = "maintained",
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
    },
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "gR",
            },
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            "#cf637e",
            "#f4a261",
            "#dbc074",
            "#aace8d",
            "#73d2d4",
            "#90c7f4",
            "#d59ee6",
        },
    },
})

vim.cmd("highlight TSDefinitionUsage gui=underline")
