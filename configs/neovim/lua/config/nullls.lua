vim.cmd [[
    command Format lua vim.lsp.buf.formatting()
]]

local null_ls = require'null-ls'
local formatter_install = require'format-installer'

local sources = {}
for _, formatter in ipairs(formatter_install.get_installed_formatters()) do
    local config = { command = formatter.cmd }
    if formatter == 'clang_format' then
        config['extra_args'] = { '--style', '{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100}' }
    elseif formatter == 'prettier' then
        config['extra_args'] = { '--tab-width=4', '--print-width=100' }
    elseif formatter == 'yapf' then
        config['extra_args'] = { '--style', '{column_limit:100}' }
    end

    table.insert(sources, null_ls.builtins.formatting[formatter.name].with(config))
end

null_ls.setup{
    sources = sources,
}
