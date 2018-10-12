""" Platy's Neovim config

""" Vim-Plug
call plug#begin()

" Aesthetics
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'

call plug#end()

""" Coloring
let g:space_vim_dark_background = 234
syntax on
colorscheme space-vim-dark
highlight Comment cterm=italic ctermfg=240 guifg=#7c7c7c
set number
set termguicolors

""" Other config
set encoding=UTF-8
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ai " Autoindent
set si " Smartindent
set wrap " Wrap lines
set tabstop=4 shiftwidth=4 
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to last edit position

""" Mappings
map <C-o> :NERDTreeToggle<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""" Set transparency
function SetTransparentBackground()
	highlight Normal ctermbg=NONE guibg=NONE
	highlight LineNr ctermbg=NONE guibg=NONE
	highlight SignColumn ctermbg=NONE guibg=NONE
endfunction

function UnsetTransparentBackground()
	colorscheme space-vim-dark
	highlight Comment cterm=italic ctermfg=240 guifg=#7c7c7c
endfunction

""" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_theme='powerlineish'

""" Limelight
let g:limelight_conceal_ctermfg = 254

""" Rainbow Parentheses
" au VimEnter * RainbowParentheses

""" Git Gutter
" set signcolumn=yes
set updatetime=200

""" NERD Tree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd vimenter * NERDTree
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

""" Deoplete
" let g:deoplete#enable_at_startup = 1
