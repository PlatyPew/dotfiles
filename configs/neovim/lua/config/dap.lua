local dap_install = require("dap-install")
for _, debugger in ipairs(require("dap-install.api.debuggers").get_installed_debuggers()) do
    dap_install.config(debugger)
end

local dap = require("dap")
dap.adapters.lldb = {
    type = "executable",
    command = "lldb-vscode",
    name = "lldb",
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.java = function(callback, config)
    M.execute_command({ command = "vscode.java.startDebugSession" }, function(err0, port)
        assert(not err0, vim.inspect(err0))

        callback({ type = "server", host = "127.0.0.1", port = port })
    end)
end

require("nvim-dap-virtual-text").setup()

require("dapui").setup()
