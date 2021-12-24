vim.g.python3_host_prog = vim.fn.getenv('DOTFILES') .. '/configs/neovim/venv/bin/python3'

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system{
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
    print('Installing packer close and reopen Neovim...')
    vim.cmd 'packadd packer.nvim'
end

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.init {
    compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua',
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

function getConfig(name)
    return string.format("require('config/%s')", name)
end

return packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use {
        'lewis6991/impatient.nvim',
        config = function()
            require'impatient'
        end
    }

    use {
        'Pocco81/Catppuccino.nvim',
        branch = 'old-catppuccino',
        config = getConfig('catppuccino'),
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
        config = getConfig('lualine'),
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
        config = getConfig('dashboard'),
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
            { 'windwp/nvim-autopairs', config = getConfig('autopair') },
        },
        config = getConfig('treesitter'),
    }

    use {
        'machakann/vim-highlightedyank',
        config = function()
            vim.cmd 'highlight HighlightedyankRegion gui=reverse'
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
        config = getConfig('lsp'),
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
        config = getConfig('dap')
    }

    use { 'anyakichi/vim-surround' }

    use {
        'folke/which-key.nvim',
        config = getConfig('whichkey')
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
                python = { left = '#', right = '' },
            }
        end
    }

    use {
        'KeitaNakamura/tex-conceal.vim',
        ft = 'text',
        config = function()
            vim.g.tex_flavor = 'latex'
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

    use {
        'hkupty/iron.nvim',
        config = getConfig('iron'),
    }

    use {
        'jbyuki/instant.nvim',
        cmd = { 'InstantStartServer', 'InstantJoinSession' },
        config = getConfig('instant'),
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
    }

    use {
        'mhartington/formatter.nvim',
        config = getConfig('format'),
    }

    use { 'vim-scripts/LargeFile' }

    require'packer_compiled'

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
