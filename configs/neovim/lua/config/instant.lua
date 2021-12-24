vim.g.instant_username = io.popen('whoami'):read('*a'):sub(0, -2)

function InstantStartSession()
    local port = vim.fn.input('Server Port: ')
    vim.api.nvim_exec('InstantStartServer 0.0.0.0 ' .. port, true)
    vim.api.nvim_exec('InstantStartSession 0.0.0.0 ' .. port, true)
    vim.cmd 'InstantStatus'
end

function InstantJoinSession()
    local host = vim.fn.input('Server Host: ')
    local port = vim.fn.input('Server Port: ')
    vim.api.nvim_exec('InstantJoinSession ' .. host .. ' ' .. port , true)
    vim.cmd 'InstantStatus'
end

function InstantStopSession()
    vim.api.nvim_exec('InstantStop')
    vim.cmd 'InstantStatus'
end

function InstantStopServer()
    vim.api.nvim_exec('InstantStopServer')
    vim.cmd 'InstantStatus'
end
