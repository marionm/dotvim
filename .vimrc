func! Mac()
  return has('unix') && system('uname') == "Darwin\n"
endfunc

func! Linux()
  return has('unix') && system('uname') != "Darwin\n"
endfunc

func! Windows()
  return has('win32')
endfunc

func! Gui()
  return has('gui_running')
endfunc

"Autoreload _vimrc when saving it
autocmd! bufwritepost .vimrc source %

"Map F2 to edit .vimrc, F3 to reload it
noremap <F2> :sp $MYVIMRC<CR>
noremap <F3> :source $MYVIMRC<CR>

"Map F12 to a sort of hacky full-file XML formatting thing
noremap <F12> :se ft=xml<CR>ggVGgJ:s/> *</>\r</g<CR>gg=G

"Use Q instead of @q to enable easier one-shot macros
noremap Q @q

"Use ctrl-space for autocompletion
inoremap <C-Space> <C-N>

"Double-tap backslash to clear search results
nmap <silent> <leader>\ :silent :nohlsearch<CR>

"Map \n to toggle NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>

"Map \r to reveal in NERDTree
nmap <silent> <leader>r :NERDTreeFind<CR>

"Map \a to Ack current word
nmap <leader>a :Ack <C-R><C-W><CR>
"Map \A to prep Ack for current word
nmap <leader>A :Ack <C-R><C-W>

"Simplify split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


syntax on
set hidden
set pastetoggle=<F5>

filetype on
filetype plugin on
filetype indent on

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

set mouse=a

set tabstop=2
set shiftwidth=2
set nowrap
set autoindent
set ttyfast
set showmode
set encoding=utf-8

"Use tabs
" set noexpandtab
"...or grudgingly conform to other people and use spaces
set expandtab

"Set up font by system
if Mac()
  set guifont=Menlo\ Regular:h13
elseif Windows()
  set guifont=Courier_New:h10
endif

if version >= 703
  "Show relative line numbers
  set relativenumber
  " Map \l to toggle between number and relativenumber
  nnoremap <silent> <leader>l :if &number==0<CR>set number<CR>else<CR>set relativenumber<CR>endif<CR>
else
  "Show line numbers
 set number
endif

"Show file info at bottom
set ruler 
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
"Show entered partial commands in ruler
set showcmd
"Always show status
set laststatus=2
"Highlight current line in Mac GUIs
if Mac() && Gui()
  set cursorline
endif

"Hide toolbar
set guioptions-=T
"Use filename as window title
set title

"Simplify external command messages
set shortmess+=filmnrxoOtT
"Allow more command history
set history=1000
"Improved external command tab completion
set wildmenu
set wildmode=list:longest,full

"Improved searching
set ignorecase
set smartcase
set hlsearch
set incsearch

"Improved scrolling and cursor movement
set scrolloff=3
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
nnoremap <C-e> 3<C-e> 
nnoremap <C-y> 3<C-y> 

"Improved split behavior
set splitbelow
set splitright

"Consolidate backup files
set backupdir=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp

"Enable undo files
if version >= 703
  set undofile
  set undodir=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

if Gui()
  try
    "Open NERDTree at startup
    " autocmd VimEnter * NERDTree
    "Make NERDTree smaller
    " 7winc <
    "Focus in editing window instead of NERDTree
    " autocmd VimEnter * wincmd p
  catch
  endtry
endif

"Set colorscheme based on system
if Mac()
  "Set background color
  autocmd VimEnter * highlight Normal guibg=#dfdfdf
  "Make file info more readable given above background color
  autocmd VimEnter * highlight StatusLineNC guibg=DarkSlateGray guifg=Gray70
else
  set background=dark
  colorscheme solarized
endif

"Enable xml folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
set foldlevelstart=20
