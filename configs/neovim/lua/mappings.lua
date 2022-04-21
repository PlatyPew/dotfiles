local remap = vim.keymap.set

-- Vanilla
-- Rebinds arrow keys to increase/decrease size of pane while in normal/visual mode
-- Increase horizontal split
remap("n", "<Up>", [[<Cmd>resize +2<CR>]], { noremap = true, silent = true })
remap("v", "<Up>", [[<Cmd>resize +2<CR>]], { noremap = true, silent = true })

-- Decrease horizontal split
remap("n", "<Down>", [[<Cmd>resize -2<CR>]], { noremap = true, silent = true })
remap("v", "<Down>", [[<Cmd>resize -2<CR>]], { noremap = true, silent = true })

-- Decrease vertical split
remap("n", "<Left>", [[<Cmd>vertical resize -2<CR>]], { noremap = true, silent = true })
remap("v", "<Left>", [[<Cmd>vertical resize -2<CR>]], { noremap = true, silent = true })

-- Increase vertical split
remap("n", "<Right>", [[<Cmd>vertical resize +2<CR>]], { noremap = true, silent = true })
remap("v", "<Right>", [[<Cmd>vertical resize +2<CR>]], { noremap = true, silent = true })

-- Better window switching
-- Move to pane on the left      Ctrl-h
remap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
-- Move to lower pane            Ctrl-j
remap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
-- Move to upper pane            Ctrl-j
remap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
-- Move to pane on the right     Ctrl-h
remap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Remap semicolon to colon
remap("n", ";", ":", { noremap = true })

-- Lazy colon, {noremap = true
remap("n", ";", ":", { noremap = true })

-- Cycling buffers
remap(
    "n",
    "<Leader>bh",
    [[<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bfirst<CR><CR>]],
    { noremap = true }
)
remap(
    "n",
    "<Leader>bj",
    [[<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR><CR>]],
    { noremap = true }
)
remap(
    "n",
    "<Leader>bk",
    [[<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR><CR>]],
    { noremap = true }
)
remap(
    "n",
    "<Leader>bl",
    [[<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:blast<CR><CR>]],
    { noremap = true }
)
remap("n", "<Leader>bq", [[<Cmd>bdelete<CR>]], { noremap = true })

-- Stops cursor from flying everywhere
remap("n", "n", "nzzzv", { noremap = true })
remap("n", "N", "Nzzzv", { noremap = true })

-- Better undo breakpoints
remap("i", ",", ",<C-g>u", { noremap = true })
remap("i", ".", ".<C-g>u", { noremap = true })

-- Move stuff in visual mode
remap("v", "J", [[:m '>+1'<CR>gv=gv]], { noremap = true })
remap("v", "K", [[:m '<-2'<CR>gv=gv]], { noremap = true })

-- Colorizer
remap("n", "<Leader>T", [[<Cmd>Transparency<CR>]], { noremap = true, silent = true })

-- FZF-Lua
remap("n", "<C-p>", function()
    require("fzf-lua").files({ cmd = 'rg --files --hidden --no-ignore-vcs -g "!.git/*"' })
end, { noremap = true, silent = true })

remap("n", "<C-g>", function()
    require("fzf-lua").live_grep_native()
end, { noremap = true, silent = true })

-- LSPSaga
remap("n", "[g", function()
    require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()
end, { noremap = true, silent = true })
remap("n", "]g", function()
    require("lspsaga.diagnostic").lsp_jump_diagnostic_next()
end, { noremap = true, silent = true })
remap("n", "ga", function()
    require("lspsaga.codeaction").code_action()
end, { noremap = true, silent = true })
remap("n", "gd", function()
    require("lspsaga.provider").preview_definition()
end, { noremap = true, silent = true })
remap("n", "gf", function()
    require("lspsaga.provider").lsp_finder()
end, { noremap = true, silent = true })
remap("n", "gh", function()
    require("lspsaga.hover").render_hover_doc()
end, { noremap = true, silent = true })
remap("n", "gr", function()
    require("lspsaga.rename").rename()
end, { noremap = true, silent = true })

-- COQ Autopairs
remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- UndoTree
remap("n", "<Tab>", [[<Cmd>UndotreeToggle<CR>]], {})

-- Format
remap("n", "g=", function()
    vim.lsp.buf.formatting_sync()
end, { noremap = true, silent = true })

-- Instant
remap("n", "<Leader>Is", [[<Cmd>call v:lua.InstantStartSession()<CR>]], {})
remap("n", "<Leader>Ij", [[<Cmd>call v:lua.InstantJoinSession()<CR>]], {})
remap("n", "<Leader>Iq", [[<Cmd>call v:lua.InstantStopSession()<CR>]], {})
remap("n", "<Leader>IQ", [[<Cmd>call v:lua.InstantStopServer()<CR>]], {})

-- Gitsigns
remap("n", "<Leader>hd", function()
    require("gitsigns").diffthis()
end, { noremap = true, silent = true })
remap("n", "]c", "&diff ? ']c' : '<Cmd>Gitsigns next_hunk<CR>'", { expr = true })
remap("n", "[c", "&diff ? '[c' : '<Cmd>Gitsigns prev_hunk<CR>'", { expr = true })

-- DAP
remap("n", "<F5>", function()
    require("dap").continue()
end, { noremap = true, silent = true })
remap("n", "<F6>", function()
    require("dap").toggle_breakpoint()
end, { noremap = true, silent = true })
remap("n", "<F10>", function()
    require("dap").step_over()
end, { noremap = true, silent = true })
remap("n", "<F11>", function()
    require("dap").step_into()
end, { noremap = true, silent = true })
remap("n", "<F12>", function()
    require("dap").step_out()
end, { noremap = true, silent = true })
remap("n", "<Leader>dc", function()
    require("dap").close()
end, { noremap = true, silent = true })
remap("n", "<Leader>dr", function()
    require("dap").repl.open()
end, { noremap = true, silent = true })
remap("n", "<Leader>du", function()
    require("dapui").toggle()
end, { noremap = true, silent = true })
remap("n", "<Leader>de", function()
    require("dapui").eval()
end, { noremap = true, silent = true })

-- SnipRun
remap("n", "<Leader>f", [[<Plug>SnipRun]], { silent = true })
remap("v", "f", [[<Plug>SnipRun]], { silent = true })
