" Formatting
syntax enable

" Spaces & tabs
set autoindent
set smartindent
set wrap
set tabstop=8		" number of visual spaces per TAB
set shiftwidth=8	" reindent << / >> width
set softtabstop=8	" number of spaces in tab when editing
set noexpandtab		" tabs do not insert spaces

" Highlighting columns
set colorcolumn=81	" highlights after 80 columns
execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Searching
set ignorecase
set smartcase
set incsearch		" search as characters are entered
set hlsearch		" highlights matches
nnoremap <leader><space> :nohlsearch<CR>

" Folding (collapsing methods, etc.)
set foldenable
set foldlevelstart=4
set foldnestmax=4
nnoremap <space> za
set foldmethod=indent	" fold based on indent level

" UI
set visualbell
set t_vb=
set cmdheight=2
set confirm
set laststatus=2
set ruler
set nocompatible
set hidden
set number
set showcmd
set cursorline
filetype indent on
filetype plugin on
set wildmenu
set lazyredraw
set mouse=a
set showmatch		" highlight matching [{()}]

" Normal Copy/Paste
set clipboard=unnamed
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"
" github.com/amix/vimrcs/basic.vim
"
set history=500
set autoread
" :W sudo saves the file
command W w !sudo tee % > /dev/null

"" UI
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set magic		" for regex
set foldcolumn=1	" extra margin on left

if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set guitablabel=%M\ %t
endif

set encoding=utf8
set ffs=unix,dos,mac

"" Disable backups b/c git
set nobackup
set nowb
set noswapfile

try
	set undor=~/.vim_runtime/temp_dirs/undodir
	set undofile
catch
endtry


