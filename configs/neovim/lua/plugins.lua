local packer = require("packer")
packer.init{
    enable = true,
    threshold = 0
}

local use = packer.use
packer.reset()

local config = 'config/'
packer.startup(function()
    use 'wbthomason/packer.nvim'

    use {
        'Pocco81/Catppuccino.nvim',
        branch = 'old-catppuccino',
        config = require(config .. 'catppuccino'),
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup()
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = require(config .. 'lualine'),
    }
    use {
        'glepnir/dashboard-nvim',
        requires = {
            {
                'ibhagwan/fzf-lua',
                config = function()
                    require'fzf-lua'.setup{
                        winopts = {
                            preview = {
                                scrollbar = false,
                                wrap = 'wrap',
                            },
                        },
                    }
                end
            },
            'kyazdani42/nvim-web-devicons'
        },
        after = 'lualine.nvim',
        config = require(config .. 'dashboard'),
    }
    use {
         'ms-jpq/chadtree',
         branch = 'chad',
         run = 'python3 -m chadtree deps --nvim',
         cmd = 'CHADopen',
     }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdateSync all',
        requires = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'p00f/nvim-ts-rainbow',
            { 'windwp/nvim-autopairs', config = require(config .. 'autopair') },
        },
        config = require(config .. 'treesitter'),
    }
    use {
        'machakann/vim-highlightedyank',
        config = function()
            vim.cmd "highlight HighlightedyankRegion gui=reverse"
            vim.g.highlightedyank_highlight_duration = -1
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require'gitsigns'.setup{
                signs = {
                    delete = { text = '│' },
                    topdelete = { text = '│' },
                    changedelete = { text = '│' },
                },
                numhl = true,
            }
        end
    }
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/nvim-lsp-installer',
            'tami5/lspsaga.nvim',
        {
            'ms-jpq/coq_nvim',
            branch = 'coq',
            run = 'python3 -m coq deps',
        },
            { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
        },
        config = require(config .. 'lsp'),
    }
    use {
        'jameshiew/nvim-magic',
        requires = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require'nvim-magic'.setup()
        end
    }
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'Pocco81/DAPInstall.nvim',
        },
        config = require(config .. 'dap')
    }
    use { 'anyakichi/vim-surround' }
    use {
        'folke/which-key.nvim',
        config = require(config .. 'whichkey')
    }
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use {
        'phaazon/hop.nvim',
        config = function()
            require'hop'.setup()
        end
    }
    use {
        'preservim/nerdcommenter',
        config = function()
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDCompactSexyComs = 1
            vim.g.NERDAltDelims_java = 1
            vim.g.NERDTrimTrailingWhitespace = 1
            vim.g.NERDToggleCheckAllLines = 1
            vim.g.NERDCustomDelimiters = {
                python = {
                    left = "#",
                    right = ""
                },
            }
        end
    }
    use {
        'KeitaNakamura/tex-conceal.vim',
        ft = 'text',
        config = function()
            vim.g.tex_conceal = 'abdgm'
            vim.g.tex_conceal_frac = 1
            vim.cmd 'highlight clear Conceal'
        end
    }
    use {
        'andweeb/presence.nvim',
        config = function()
            require'presence':setup{ enable_line_number = true }
        end
    }
    use { 'hkupty/iron.nvim' }
    use { 'lewis6991/impatient.nvim' }
    use {
        'jbyuki/instant.nvim',
        cmd = { 'InstantStartServer', 'InstantJoinSession' },
        config = require(config .. 'instant'),
    }
    use {
        'kkoomen/vim-doge',
        run = './scripts/install.sh',
        cmd = 'DogeGenerate',
        config = function()
            vim.g.doge_mapping = '<Leader>K'
            vim.g.doge_doc_standard_c = 'kernel_doc'
        end
    }
    use {
        'mattn/emmet-vim',
        ft = { 'html', 'css', 'markdown', 'javascriptreact' },
    }
    use {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = function()
            vim.cmd [[
                if has('persistent_undo')
                    set undodir=~/.cache/nvim/undotree
                    set undofile
                endif
            ]]
        end
    }
    use {
        'mhartington/formatter.nvim',
        config = require(config .. 'format'),
    }
    use { 'vim-scripts/LargeFile' }
end)


vim.g.python3_host_prog = vim.fn.getenv('DOTFILES') .. '/configs/neovim/venv/bin/python3'
