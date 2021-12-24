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
