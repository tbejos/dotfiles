" Formatting
syntax enable

" Spaces & tabs
set autoindent
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
nnoremap <space> za	" space open/closes folds
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
set wildmenu
set lazyredraw
set mouse=a
set showmatch		" highlight matching [{()}]