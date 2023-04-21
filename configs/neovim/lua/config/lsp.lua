local servers = {
    lua_ls = {},
    pyright = {},
    tsserver = {},
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.offsetEncoding = { "utf-16" }

if require("jit").os == "Linux" and require("jit").arch == "arm64" then
    require('lspconfig').clangd.setup({
        capabilities = capabilities,
    })
else
    servers.clangd = {}
end

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            settings = servers[server_name],
        }
    end,
    ["jdtls"] = function()
        require('lspconfig').jdtls.setup({
            init_options = {
                bundles = {
                    vim.fn.glob(
                        require("mason-registry").get_package("java-debug-adapter"):get_install_path() ..
                        "/extension/server/com.microsoft.java.debug.plugin-*.jar"
                    ),
                },
            },
            extendedCapabilities = require("jdtls").extendedClientCapabilities,
            filetypes = { "java" },
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
                require("jdtls").setup_dap({ hotcodereplace = "auto" })
                require("jdtls.dap").setup_dap_main_class_configs()
            end,
        })
    end,
}

vim.fn.sign_define(
    "DiagnosticSignError",
    { text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
    "DiagnosticSignWarn",
    { text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
    "DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" }
)
vim.fn.sign_define(
    "DiagnosticSignInfo",
    { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" }
)
