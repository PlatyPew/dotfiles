-- Colours
vim.cmd([[
    highlight Pmenu ctermfg=247 ctermbg=235
    highlight PmenuSel ctermfg=0 ctermbg=13
    highlight LspDiagnosticsDefaultError ctermfg=9
    highlight LspDiagnosticsDefaultWarning ctermfg=3
]])

-- Settings
vim.g.coq_settings = {
    auto_start = "shut-up",
    clients = {
        tabnine = {
            enabled = true,
        },
    },
    keymap = {
        recommended = false,
        jump_to_mark = "<c-e>",
    },
}

local lspconfig = require("lspconfig")
local coq = require("coq")
local coq_3p = require("coq_3p")
local lspinstall = require("nvim-lsp-installer")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspinstall.on_server_ready(function(server)
    local config = {
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end,
    }

    if server.name == "texlab" then
        config.settings = {
            texlab = {
                build = {
                    args = { "-halt-on-error", "%f" },
                    executable = "pdflatex",
                    onSave = true,
                },
            },
        }
    elseif server.name == "html" or server.name == "emmet_ls" then
        config.filetypes = { "html", "css", "javascriptreact" }
    elseif server.name == "jdtls" then
        local path = vim.fn.stdpath("data")

        --[[ local cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xms1g", "-Xmx2G",
            "-javaagent:" .. path .. "/lsp_servers/jdtls/lombok.jar",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar", path .. "/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
            "-configuration", path .. "/lsp_servers/jdtls/config_mac",
            "-data", vim.fn.getenv("HOME") .. "/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),
        } ]]

        local init_options = {
            bundles = {
                vim.fn.glob(
                    path
                        .. "/dapinstall/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
                ),
            },
        }
        config.init_options = init_options
    end

    server:setup(coq.lsp_ensure_capabilities(config))
end)

coq_3p({
    { src = "copilot", short_name = "COP", accept_key = "<C-f>" },
})

require("lspsaga").init_lsp_saga({
    finder_action_keys = {
        open = { "<CR>", "o" },
        quit = { "q", "<esc>", "<C-c>" },
    },
    code_action_keys = {
        quit = { "q", "<esc>", "<C-c>" },
    },
    rename_action_keys = {
        quit = { "<esc>", "<C-c>" },
    },
})
