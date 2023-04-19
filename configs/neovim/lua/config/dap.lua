local dap = require("dap")

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Conditional" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "String" })

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

require('mason-nvim-dap').setup {
    -- Makes a best effort to setup the various debuggers with
    -- reasonable debug configurations
    automatic_setup = true,

    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    handlers = {},

    -- You'll need to check that you have the required things installed
    -- online, please don't ask me how to install them :)
    ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
    },
}

dap.configurations.cpp = {
    {
        name = "Launch LLDB",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: " .. vim.fn.getcwd() .. "/" .. "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " ")
        end,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.configurations.java = {
    {
        type = "java",
        request = "attach",
        name = "Attach To Process",
        hostName = "127.0.0.1",
        port = 5005,
    },
}

require("nvim-dap-virtual-text").setup()

require("dapui").setup()
