"  ██▓ ███▄    █  ██▓▄▄▄█████▓      ██▒   █▓ ██▓ ███▄ ▄███▓
" ▓██▒ ██ ▀█   █ ▓██▒▓  ██▒ ▓▒     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
" ▒██▒▓██  ▀█ ██▒▒██▒▒ ▓██░ ▒░      ▓██  █▒░▒██▒▓██    ▓██░
" ░██░▓██▒  ▐▌██▒░██░░ ▓██▓ ░        ▒██ █░░░██░▒██    ▒██
" ░██░▒██░   ▓██░░██░  ▒██▒ ░  ██▓    ▒▀█░  ░██░▒██▒   ░██▒
" ░▓  ░ ▒░   ▒ ▒ ░▓    ▒ ░░    ▒▓▒    ░ ▐░  ░▓  ░ ▒░   ░  ░
"  ▒ ░░ ░░   ░ ▒░ ▒ ░    ░     ░▒     ░ ░░   ▒ ░░  ░      ░
"  ▒ ░   ░   ░ ░  ▒ ░  ░       ░        ░░   ▒ ░░      ░
"  ░           ░  ░             ░        ░   ░         ░
"                               ░       ░

""" Vim-Plug -----------------------------------------------------------------
call plug#begin()                                                       " Plugin manager Vim-Plug

"" Aesthetics
" Colours
Plug 'Pocco81/Catppuccino.nvim'
" User Interface
Plug 'shadmansaleh/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'                                     " Allows for nerdfont icons to be displayed
Plug 'p00f/nvim-ts-rainbow'
Plug 'mhinz/vim-startify'                                               " Better startup screen for vim
" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate all'}         " Better syntax parser
Plug 'machakann/vim-highlightedyank'

"" Functionalities
" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':CHADdeps',
                \ 'on': ['CHADopen', 'CHADdeps']}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}                      " Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Auto-completion
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq', 'do': ':COQdeps'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'tami5/lspsaga.nvim'
Plug 'kabouzeid/nvim-lspinstall'
"More efficient (lazy) plugins
Plug 'mg979/vim-visual-multi', {'branch': 'master'}                     " Sublime-styled multiple cursors support
Plug 'windwp/nvim-autopairs'
Plug 'easymotion/vim-easymotion'                                        " Enhanced mobility in vim
Plug 'preservim/nerdcommenter'                                          " Easy commenting
Plug 'anyakichi/vim-surround'                                           " Surround highlighted text easier
Plug 'liuchengxu/vim-which-key'
" Misc
Plug 'vim-scripts/LargeFile'                                            " Edit large files quickly
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                        " Undo visualiser
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'markdown', 'vue']}     " Quick way to generatre html
Plug 'kkoomen/vim-doge', {'do': { -> doge#install() },
            \ 'on': 'DogeGenerate'}      " Documentation Generator
Plug 'nvim-treesitter/nvim-treesitter-refactor'                         " Better refactor tool
Plug 'jbyuki/instant.nvim',
            \ {'on': ['InstantStartServer', 'InstantJoinSession']}      " Peer pair programming
Plug 'sbdchd/neoformat',
            \ {'for': ['c', 'cpp', 'python', 'javascript'],
            \ 'on': 'Neoformat'}                                        " Auto formatter
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'lewis6991/impatient.nvim'
Plug 'abecodes/tabout.nvim'

Plug 'andweeb/presence.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()
""" End Of Vim-Plug -----------------------------------------------------------


""" Optimisation ---------------------------------------------------------------
"" Lua cache loading
lua require('impatient')
set lazyredraw
set ttyfast
set foldmethod=syntax
set foldmethod=expr
set showcmd
set noruler
" set eventignore=all " Ultimate optimisation. Basically no plugins or anything run
""" End Of Optimisation ---------------------------------------------------------


""" Plugin Colouring ----------------------------------------------------------
lua <<EOF
vim.g.transparent = true

local catppuccino = require("catppuccino")
catppuccino.setup({
    colorscheme = 'soft_manilo',
    transparency = vim.g.transparent,
    integrations = {
        lsp_saga = true,
        gitgutter = true,
    },
})

function transparency()
    vim.g.transparent = not vim.g.transparent
    catppuccino.setup({transparency = vim.g.transparent})
    vim.cmd("colorscheme catppuccino")
end
EOF

command Transparency lua transparency()
nnoremap <silent><Leader>T :Transparency<CR>
""" End Of Plugin Colouring ---------------------------------------------------


""" Vanilla Colouring ---------------------------------------------------------
syntax on                                                               " Enable syntax highlighting
" Enable true colours
colorscheme catppuccino
highlight ColorColumn guifg=#d84652 guibg=#000000
""" End Of Vanilla Colouring --------------------------------------------------


""" Vanilla Configurations ----------------------------------------------------
set number relativenumber
set encoding=UTF-8
set backspace=eol,start,indent
set whichwrap+=<,>,h,l                                                  " Cursor wrap around in normal mode
set autoindent
set smartindent
set wrap
set tabstop=4 shiftwidth=4 
set tabstop=4
set softtabstop=4
set expandtab                                                           " #spacemasterrace
set list listchars=tab:»·,trail:·,nbsp:·                                " Show trailing spaces and hard tabs
set cursorline
set splitright                                                          " Set vertical split to always split to the right
set splitbelow
call matchadd('ColorColumn', '\%101v[^\n]')                             " Show colour coloumn only at lines that pass 101 characters
set noshowmode
set updatetime=50
set spelllang=en_gb
augroup spell_check
    autocmd!
    autocmd FileType text,markdown,tex setlocal spell
    autocmd FileType text,markdown,tex highlight clear ColorColumn
augroup END
let g:tex_flavor = 'latex'
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }
""" End Of Vanilla Configurations ----------------------------------------------


""" Vanilla Rebindings -------------------------------------------------------
"" Rebinds arrow keys to increase/decrease size of pane while in normal/visual mode
" Increase horizontal split
nnoremap <silent> <Up> :resize +2 <CR>
vnoremap <silent> <Up> :resize +2 <CR>
" Decrease horizontal split
nnoremap <silent> <Down> :resize -2 <CR>
vnoremap <silent> <Down> :resize -2 <CR>
" Decrease vertical split
nnoremap <silent> <Left> :vertical resize -2 <CR>
vnoremap <silent> <Left> :vertical resize -2 <CR>
" Increase vertical split
nnoremap <silent> <Right> :vertical resize +2 <CR>
vnoremap <silent> <Right> :vertical resize +2 <CR>

"" Better window switching
" Move to pane on the left      Ctrl-h
nmap <C-h> <C-W>h
" Move to lower pane            Ctrl-j
nmap <C-j> <C-W>j
" Move to upper pane            Ctrl-j
nmap <C-k> <C-W>k
" Move to pane on the right     Ctrl-h
nmap <C-l> <C-W>l

"" Better tab
" Create new tabs    \t
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tj :tabNext<CR>
nnoremap <leader>tk :tabprevious<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tq :tabclose<CR>

"" Easy Save
" Save files    Ctrl-s
imap <C-s> <Esc>:w<CR>a

"" Remap semicolon to colon
nnoremap ; :

"" Cycling buffers
nnoremap <leader>bh :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bfirst<CR><CR>
nnoremap <leader>bj :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR><CR>
nnoremap <leader>bk :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR><CR>
nnoremap <leader>bl :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:blast<CR><CR>
nnoremap <leader>bq :bdelete<CR>

"" Capital Y now actually makes sense
nnoremap Y yg_

"" Stops cursor from flying everywhere
nnoremap n nzzzv
nnoremap N Nzzzv

"" Better undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u

"" Move stuff in visual mode
vnoremap J :m '>+1'<CR>gv=gv
vnoremap K :m '<-2'<CR>gv=gv
""" End Of Vanilla Rebindings -------------------------------------------------


""" Highlighted Yank Configurations -------------------------------------------
"" Colours
highlight HighlightedyankRegion gui=reverse

"" Settings
let g:highlightedyank_highlight_duration = -1
""" End Of Highlighted Yank Configurations ------------------------------------


""" Lualine Configurations ----------------------------------------------------
lua <<EOF
require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccino',
        section_separators = {left = '', right = ''},
        component_separators = {left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename', 'filesize'},
        lualine_x = {
            'location',
            {
                'filetype',
                colored = true,
            },
        },
        lualine_y = {
            {
                'encoding',
                padding = { left = 1, right = 0 },
            },
            'fileformat',
        },
        lualine_z = {
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    error = {bg = "#222424", fg = "#cf637e"},
                    warn = {bg = "#222424", fg = "#f4a261"},
                    info = {bg = "#222424", fg = "#dbc074"},
                }
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'branch', {
                'diff',
                colored = false,
            }
        },
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                buffers_color = {
                    inactive = {bg = '#44475a', fg = '#ffffff'},
                },
                padding = 0,
            }
        },
        lualine_y = {function () return [[buffers]] end}
    },
    extensions = {'fzf', 'chadtree'},
}
EOF
""" End Of Lualine Configurations ---------------------------------------------


"" CHADTree Configurations ---------------------------------------------------
"" Mappings
" Activate CHADTree    Ctrl-o
nmap <C-o> :CHADopen<CR>

" Open directories with chadtree instead of netrw
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'CHADopen' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
""" End Of CHADTree Configurations --------------------------------------------


""" FZF Configurations --------------------------------------------------------
"" Settings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Constant', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs -g '!.git/*'"

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let $BAT_THEME = 'TwoDark'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"" Mappings
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent><C-g> :RG<CR>
""" End Of FZF Configurations -------------------------------------------------


""" LSP Configurations --------------------------------------------------------
"" Colours
highlight Pmenu ctermfg=247 ctermbg=235
highlight PmenuSel ctermfg=0 ctermbg=13
highlight LspDiagnosticsDefaultError ctermfg=9
highlight LspDiagnosticsDefaultWarning ctermfg=3

" LSP settings
lua <<EOF
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
local lspinstall = require'lspinstall'

local jedi_config = require"lspinstall/util".extract_config("jedi_language_server")
jedi_config.default_config.cmd[1] = "./venv/bin/jedi-language-server"

require'lspinstall/servers'.jedi = vim.tbl_extend('error', jedi_config, {
     install_script = [[
         python3 -m venv ./venv
         ./venv/bin/pip3 install --upgrade pip
         ./venv/bin/pip3 install --upgrade jedi-language-server
     ]]
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspinstall.setup()
local servers = lspinstall.installed_servers()
table.insert(servers, 'clangd')

for _, server in pairs(servers) do
    local config = {
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
        root_dir = lspconfig.util.path.dirname,
    }

    if server == 'latex' then
        config.settings = { texlab = { build = {
            args = { "-halt-on-error", "%f" },
            executable = "pdflatex",
            onSave = true,
        }, }, }
    elseif server == 'clangd' then
        config.cmd = { "/usr/local/opt/llvm/bin/clangd", "--background-index", "--clang-tidy" }
    end

    lspconfig[server].setup(coq.lsp_ensure_capabilities(config))
end

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
EOF

nnoremap <silent>gd :Lspsaga preview_definition<CR>
nnoremap <silent>gh :Lspsaga hover_doc<CR>
nnoremap <silent>gf :Lspsaga lsp_finder<CR>
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent>gc :Lspsaga code_action<CR>
""" End Of LSP Configurations -------------------------------------------------


""" Undo Tree Configurations --------------------------------------------------
"" Mappings
" Activate Undo Tree    Tab
nmap <Tab> :UndotreeToggle<CR>

"" Settings
" Loads persistent undo tree to ~/.cache
if has('persistent_undo')
    set undodir=~/.cache/nvim/undotree
    set undofile
endif
""" End Of UndoTree Configurations --------------------------------------------


""" Autopairs Configurations --------------------------------------------------
"" Settings
lua <<EOF
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false })

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
        return npairs.esc('<c-y>')
    else
        return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
    else
        return npairs.autopairs_cr()
    end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
        return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
EOF
""" End Of Autopairs Configurations -------------------------------------------


""" Nerd Commenter Configurations ---------------------------------------------
"" Settings
let g:NERDSpaceDelims = 1                      " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                  " Use compact syntax for prettified multi-line comments
let g:NERDAltDelims_java = 1                   " Set a language to use its alternate delimiters by default
let g:NERDTrimTrailingWhitespace = 1           " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1              " Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#', 'right': '' }
    \ }                                        " Fix for double spacing while commenting Python
""" End Of Nerd Commenter Configurations --------------------------------------


""" Doge Configurations -------------------------------------------------------
let g:doge_mapping = '<Leader>K'
let g:doge_doc_standard_c = 'kernel_doc'
""" End of Doge Configurations ------------------------------------------------

""" TreeSitter Configurations -------------------------------------------------
"" Enable tree sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
    },
    refactor = {
        highlight_definitions = { enable = true },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            '#cf637e',
            '#f4a261',
            '#dbc074',
            '#aace8d',
            '#73d2d4',
            '#90c7f4',
            '#d59ee6',
        },
    },
}
EOF

"" Underline definitions
highlight TSDefinitionUsage gui=underline
""" End of TreeSitter ---------------------------------------------------------

""" Instant Settings-----------------------------------------------------------
let g:instant_username = trim(system('whoami'))

function StartInstantSession()
    let port = input('Server Port: ')
    silent execute('InstantStartServer 0.0.0.0 ' . port)
    silent execute('InstantStartSession 0.0.0.0 ' . port)
    execute('InstantStatus')
endfunction

function JoinInstantSession()
    let host = input('Server Host to connect: ')
    let port = input('Server Port to connect: ')
    silent execute('InstantJoinSession ' . host . ' ' . port)
    execute('InstantStatus')
endfunction

function StopInstantSession()
    silent execute('InstantStop')
    execute('InstantStatus')
endfunction

function StopInstantServer()
    silent execute('InstantStopServer')
    execute('InstantStatus')
endfunction

nmap <leader>Is :call StartInstantSession()<CR>
nmap <leader>Ij :call JoinInstantSession()<CR>
nmap <leader>Iq :call StopInstantSession()<CR>
nmap <leader>IQ :call StopInstantServer()<CR>
""" End of Instant  -----------------------------------------------------------


""" Neoformat Settings --------------------------------------------------------
"" Mappings
" Format code
nnoremap <silent> g= :Neoformat <CR>

"" Settings
" Clang-format
let g:neoformat_c_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100}"']
\}
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100}"']
\}

" Yapf
let g:neoformat_python_yapf = {
    \ 'exe': 'yapf',
    \ 'args': ['--style="{column_limit: 100}"']
\}

" Prettier
let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin-filepath', '"%:p"', '--tab-width=4', '--print-width=100'],
    \ 'stdin': 1,
\}

let g:neoformat_vue_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin-filepath', '"%:p"', '--tab-width=4', '--print-width=100', '--vue-indent-script-and-style'],
    \ 'stdin': 1,
\}
""" End of Neoformat Settings -------------------------------------------------


""" Tex Conceal Setings -------------------------------------------------------
set conceallevel=2
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1
highlight clear Conceal
""" End of Tex Conceal Setings ------------------------------------------------


lua <<EOF
-- Tabout
require'tabout'.setup()

-- Discord Rich Presence
require("presence"):setup({ enable_line_number = true })

-- Gitsigns
require('gitsigns').setup{
    signs = {
        delete = { text = '│' },
        topdelete = { text = '│' },
        changedelete = { text = '│' },
    },
    numhl = true,
}

vim.api.nvim_set_keymap('n', '<Leader>hd', '[[<cmd>lua require("gitsigns").diffthis()<CR>]]', { noremap = true, silent = true })
EOF

let g:maplocalleader = ','
nnoremap <silent> <localleader> :silent WhichKey ','<CR>
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0
let g:which_key_map = {}

highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map.o = [':CHADopen','File Explorer']
let g:which_key_map.t = [':Lspsaga open_floaterm','Open terminal']
let g:which_key_map.D = [':DogeGenerate','Generate docs']
let g:which_key_map.F = [':Neoformat','Format code']
let g:which_key_map.u = [':UndotreeToggle','Toggle UndoTree']
let g:which_key_map.T = [':Transparency','Toggle Transparency']

let g:which_key_map.f = {
    \ 'name' : '+FZF',
    \ 'f' : [':Files','Files'],
    \ 'g' : [':GFiles','Git files'],
    \ 'G' : [':GFiles?','Git status files'],
    \ 'b' : [':Buffers','Buffers'],
    \ 'r' : [':RG','Ripgrep'],
    \ '\' : [':Lines','Lines'],
    \ '/' : [':BLines','Lines in buffer'],
    \ 'm' : [':Marks','Marks'],
    \ 'h' : [':History:','Command history'],
    \ 'H' : [':History/','Search history'],
    \ 'C' : [':Commits','Commits'],
    \ 'c' : [':BCommits','Commits for buffer'],
    \ 'M' : [':Maps','Mappings'],
    \ }

let g:which_key_map.g = {
    \ 'name' : '+Git' ,
    \ ']' : [':Gitsigns next_hunk','Next hunk'],
    \ '[' : [':Gitsigns prev_hunk','Previous hunk'],
    \ 'S' : [':Gitsigns stage_hunk','Stage hunk'],
    \ 'u' : [':Gitsigns undo_stage_hunk','Undo stage hunk'],
    \ 'r' : [':Gitsigns reset_hunk','Reset hunk'],
    \ 'R' : [':Gitsigns reset_buffer','Reset buffer'],
    \ 'p' : [':Gitsigns preview_hunk','Preview hunk'],
    \ 'b' : [':Gitsigns blame_line','Blame line'],
    \ 's' : [':Gitsigns stage_buffer','Stage buffer'],
    \ 'U' : [':Gitsigns reset_buffer_index','Reset buffer index'],
    \ 'd' : [':Gitsigns diffthis','Reset buffer index'],
    \ }

let g:which_key_map.l = {
    \ 'name' : '+LSPSaga' ,
    \ 'f' : [':Lspsaga lsp_finder','Find reference'],
    \ 'c' : [':Lspsaga code_action','Code action'],
    \ 'h' : [':Lspsaga hover_doc','Docs'],
    \ 's' : [':Lspsaga signature_help','Show signature'],
    \ 'r' : [':Lspsaga rename','Rename variable'],
    \ 'p' : [':Lspsaga preview_definition','Preview definition'],
    \ 'd' : [':Lspsaga show_cursor_diagnostics','Show cursor diagnostics'],
    \ 'D' : [':Lspsaga show_line_diagnostics','Show line diagnostics'],
    \ 'i' : [':LspInfo','LSP info'],
    \ }

" Register which key map
call which_key#register(',', "g:which_key_map")
