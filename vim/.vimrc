""" Coloring
let g:space_vim_dark_background = 234
syntax on
colorscheme space-vim-dark
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
set lazyredraw
set ttyfast

""" Mappings
" Better window switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Better tab switching
map <C-t><left> :tabn<cr>
map <C-t><right> :tabN<cr>
nmap <leader>t :call ToggleTransparentMode()<CR>

""" Set transparency
function SetTransparentBackground()
	highlight Normal ctermbg=NONE guibg=NONE
	highlight LineNr ctermbg=NONE guibg=NONE
	highlight SignColumn ctermbg=NONE guibg=NONE
endfunction

function UnsetTransparentBackground()
	colorscheme space-vim-dark
endfunction

let s:transparent = 0
function ToggleTransparentMode()
    if s:transparent
        call UnsetTransparentBackground()
		let s:transparent = 0
	else
        call SetTransparentBackground()
		let s:transparent = 1
	endif
endfunction
