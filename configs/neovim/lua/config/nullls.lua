vim.cmd [[
    command Format lua vim.lsp.buf.formatting()
]]

local null_ls = require'null-ls'

null_ls.setup{
    sources = {
        null_ls.builtins.formatting.clang_format.with{
            extra_args = {
                '--style', '{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100}',
            },
        },

        null_ls.builtins.formatting.prettier.with{
            extra_args = { '--tab-width=4', '--print-width=100' },
        },

        null_ls.builtins.formatting.yapf.with{
            extra_args = { '--style', '{column_limit:100}' },
        },
    },
}
