"{ UI-related settings
"{{ General settings about colors
" Enable true colors support. Do not set this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and
" https://gist.github.com/XVilka/8346728.
if match($TERM, '^xterm.*') != -1 || exists('g:started_by_firenvim')
  set termguicolors
endif
" Use dark background
set background=dark
"}}

try
	" colorscheme spacegray
	" let g:spacegray_use_italics = 1																				" use italics
	" colorscheme solarized
	" colorscheme molokai
	" let g:molokai_original = 1
	" let g:rehash256 = 1
	colorscheme onedark
	let g:onedark_terminal_italics=1
catch
	colorscheme ron
endtry

set guifont=FiraCode\ Nerd\ Font:h13

