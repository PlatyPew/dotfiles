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
