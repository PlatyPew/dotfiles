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
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end,
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
