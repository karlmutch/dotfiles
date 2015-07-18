call pathogen#infect()                      " use pathogen
call pathogen#helptags()

syntax on            " Turn on syntax highlighting
                     " (makes code and config files more readable)
set background=dark  " If using a dark background, instead of the
                     " usual white background in Terminal
                     " (makes darker colors brighter)
set incsearch        " Used for incremental searching
                     " (useful when searching large text files)
set hlsearch         " Turns on highlighting for matched search patterns
                     " (use :nohlsearch inside vim to turn off highlights
                     " after a search)
set tabstop=4        " Sets the tab size to 4
                     " (tabs are usually 8 spaces)
set expandtab        " Tab key inserts spaces instead of tabs
set shiftwidth=4     " Sets spaces used for (auto)indent
set shiftround       " Indent to nearest tabstop
set autoindent       " Carries over previous indent to the next line

set nocompatible
set vb t_vb=
set ruler
set incsearch
set t_Co=256
"set number              " show line numbers
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
set wildmenu            " Turn on the WiLd menu
set showmatch           " highlight matching [{()}]

set nowrap
set sidescroll=5
set listchars+=precedes:▶,extends:◀
set fillchars+=vert:│
hi clear VertSplit
highlight link VertSplit NONE
hi VertSplit  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=yellow ctermbg=black cterm=NONE

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

filetype plugin indent on
filetype plugin on

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set mouse=a

"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Always show statusline
set laststatus=2

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=10
    augroup END
endif

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" Check if NERDTree is open or active
function! rc:isNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
" function! rc:syncTree()
"  if &modifiable && rc:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction

let NERDTreeQuitOnOpen = 1

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call rc:syncTree()
