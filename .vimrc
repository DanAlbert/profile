" Load Pathogen
execute pathogen#infect()

" Set GUI font
set gfn=DejaVu\ Sans\ Mono\ 11

" Alias .dox files to C syntax
au BufNewFile,BufRead *.dox set filetype=c

syntax on

" In case this machine's implementation of backspace is borked
set backspace=indent,eol,start

" Tab config
set tabstop=4
set shiftwidth=4

" Word wrap
set tw=80

" Remember undo between sessions
if has('persistent_undo')
	set undofile
	set undolevels=1000
	set undoreload=10000
endif

" Large command history
set history=1000

" Turn on line numbering and change colors
"set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Auto-detect indent settings
if has("autocmd")
	filetype plugin indent on
endif

" Jump to the last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"  move text and rehighlight -- vim tip_id=224 
vnoremap > ><CR>gv 
vnoremap < <<CR>gv 

" Highlight beyond 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Enter key or space bar removes search highlighing
nnoremap <CR> :noh<CR><CR>
nnoremap <Space> :noh<CR><Space>

" Don't clobber pasted code
set pastetoggle=<F2>
