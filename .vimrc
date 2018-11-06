set number
set ignorecase
set smartindent
set softtabstop=8 tabstop=8 shiftwidth=4 expandtab
set autoindent
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd

set ai
set hlsearch
set incsearch

set wildmenu
set wildmode=list:longest,full 

noremap j gj
noremap k gk
noremap <up> gk
noremap <down> gj

nnoremap Y y$



set mouse=a
set mousehide
set history=1000
if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

execute pathogen#infect()
syntax on
filetype plugin indent on
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

function! PageUp()
	let c=line(".")
	let l=line("$")
	let a=l-c
	if a<25
		:$
	else
		:+25
	endif
endfunction

function! PageDown()
	let c=line(".")
	if c<25
		:0
	else
		:-25
	endif
endfunction


:nmap + :call PageUp()<CR> 
:nmap - :call PageDown()<CR>

:colorscheme ron
