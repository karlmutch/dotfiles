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
set softtabstop=4    " 4 space tab
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
set list listchars=precedes:▶,extends:◀,tab:»·,trail:·,eol:¶

hi NonText  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=236 ctermbg=black cterm=NONE
hi SpecialKey  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=240 ctermbg=black cterm=NONE

hi VertSplit  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=yellow ctermbg=black cterm=NONE
set fillchars+=vert:│
hi clear VertSplit
highlight link VertSplit NONE
hi VertSplit  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=yellow ctermbg=black cterm=NONE

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

highlight ExtraWhitespace ctermbg=blue

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

set mouse=a

"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Always show statusline
set laststatus=2

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

hi Cursor               ctermfg=green         ctermbg=green
hi iCursor              ctermfg=red         ctermbg=red

set guicursor=n-v-c:block-Cursor
set guicursor+=i-ci:ver25-iCursor

if &term == 'xterm-256color' || &term == 'screen-256color' || &term == 'rxvt-unicode-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
    if exists('$TMUX')
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[1 q\<Esc>\\"
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
    endif
endif

if $TERM_PROGRAM =~ "iTerm"
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
endif

set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:colortuner_enabled = 1

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
function! rc:syncTree()
  if &modifiable && rc:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('go', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let NERDTreeQuitOnOpen = 1

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call rc:syncTree()

autocmd VimEnter * TagbarToggle
autocmd VimEnter * call DWM_AutoEnter()
"autocmd VimEnter * NERDTreeFocusToggle
"autocmd VimEnter * NERDTreeFocusToggle
let g:nerdtree_tabs_open_on_console_startup=0
let g:NERDTreeHijackNetrw=1
"let g:nerdtree_tabs_smart_startup_focus=2

" 1. split to tiled windows
"nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
"nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
"nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
"nmap <silent> <C-N>  <Plug>GoldenViewNext
"nmap <silent> <C-P>  <Plug>GoldenViewPrevious

let g:goldenview__enable_default_mapping = 0
let g:goldenview__enable_at_startup = 0
let g:dwm_map_keys = 1
let g:dwm_master_pane_width=128
