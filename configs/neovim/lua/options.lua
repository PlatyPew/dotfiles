-- Optimisation
vim.o.foldmethod = "expr"
vim.o.lazyredraw = true
vim.o.ruler = false

-- Colouring
vim.o.termguicolors = true

-- Configurations
vim.o.cursorline = true
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.list = true
vim.o.listchars = "tab:»·,trail:·,nbsp:·"
vim.o.mouse = "nvi"
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.softtabstop = 4
vim.o.spelllang = "en_gb"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.updatetime = 50
vim.o.whichwrap = "b,s,<,>,h,l"
vim.o.wrap = true

-- Copy Paste
vim.g.clipboard = {
    name = "pbcopy",
    copy = {
        ["*"] = "pbcopy",
        ["+"] = "pbcopy",
    },
    paste = {
        ["*"] = "pbpaste",
        ["+"] = "pbpaste",
    },
    cache_enabled = 0,
}

-- TreeSitter
vim.o.foldenable = false
vim.o.foldlevel = 20
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- WhichKey
vim.o.timeoutlen = 500

-- UndoTree
vim.cmd([[
    set undodir=~/.cache/nvim/undotree
    set undofile
]])
