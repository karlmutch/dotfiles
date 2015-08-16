call pathogen#infect('~/.vim/bundle-0/{}', '~/.vim/bundle/{}')                      " use pathogen
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

set backup                      " file backup
set backupdir=~/.vim_temp/backup     " directory for backup files
set directory=~/.vim_temp/swap       " directory for swap files

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
set showbreak=↪

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

" Use grays instead of blues in 256-color terminal:
let g:GitShade_ColorGradient = "black_to_grey"
let g:GitShade_ColorWhat = "bg"
let g:GitShade_Colors_For_CTerm_256 = [ 0, 232, 233, 234, 235, 236, 237, 238, 239 ]
let g:GitShade_Linear = 1

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

filetype plugin indent on
filetype plugin on

augroup reload_vimrc " {
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }"

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

set mouse+=a
if &term =~ '^screen' || &term =~ '^rxvt'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set rtp+=~/.fzf

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


" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['go'] = ''

set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:colortuner_enabled = 1
let g:rainbow_active = 1

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
"autocmd VimEnter * call DWM_AutoEnter()
"autocmd VimEnter * NERDTreeFocusToggle
"autocmd VimEnter * NERDTreeFocusToggle
let g:nerdtree_tabs_open_on_console_startup=0
let g:NERDTreeHijackNetrw=1
"let g:nerdtree_tabs_smart_startup_focus=2
let g:NERDTreeWinPos = "right"

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim-NERDTreeBookmarks")
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
"

let g:goldenview__enable_default_mapping = 0
let g:goldenview__enable_at_startup = 0

nmap <F3> :NERDTreeToggle<CR>
nmap <F5> :make<CR>:copen<CR>

nnoremap <silent> <F2>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <F2>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>


" Go Specific Stuff

au BufRead,BufNewFile *.go set filetype=go
autocmd FileType go setlocal softtabstop=4
autocmd FileType go setlocal shiftwidth=4
autocmd FileType go setlocal tabstop=4

"
" go-vim settings
let g:go_fmt_command = "goimports"
" " Enable syntax highting on everything
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" go-def settings
let g:godef_split=2
let g:godef_same_file_in_same_window=1


" tagbar settings                                                                  
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ } 

" folding
set foldmethod=indent
set nofoldenable
set foldlevel=1
set foldnestmax=10

let g:netrw_liststyle = 3
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window % " . expand("%:t"))
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title


function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Go keyboard mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au Filetype go set makeprg=go\ build\ ./...
au FileType go let b:delimitMate_autoclose = 0

" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
"nmap <silent> <C-'>  <Plug>GoldenViewNext
"nmap <silent> <C-;>  <Plug>GoldenViewPrevious
