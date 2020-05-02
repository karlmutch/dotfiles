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

set path+=~/darkcycle-sdk/cpp

set nocompatible
set vb t_vb=
set ruler
set incsearch
set t_Co=256
set cursorline
set number              " show line numbers
set showcmd             " show command in bottom bar
set wildmenu            " Turn on the WiLd menu
set showmatch           " highlight matching [{()}]

set nowrap
set sidescroll=5
set scrolloff=3               " keep at least 3 lines above/below
"set list listchars=precedes:▶,extends:◀,tab:»·,trail:·,eol:¶
set list listchars=precedes:▶,extends:◀,tab:»·,trail:·,eol:¶
set showbreak=↪

set wildignore+=*.o,*.out,*.obj,*.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*

set undofile
set undodir=~/.vim/undodir

" Filetypes {

        filetype plugin indent on                       " Turn on plugins

        if has ("autocmd")
                au Filetype make setlocal noexpandtab   " In makefiles, use real tabs, not tabs expanded to spaces

                au BufRead,BufNewFile {Gemfile,Rakefile,*.rake} setf ruby

                au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdb,txt} setf markdown

                au BufRead,BufNewFile *.json setf javascript
        endif
" }


" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>


" Colors and scheme changes
"

match NonText '^[	 ]\+'
hi NonText  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=234 ctermbg=black cterm=NONE
hi clear SpecialKey
hi link SpecialKey NonText

autocmd FileType go hi NonText guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=234 ctermbg=black cterm=NONE
autocmd FileType go match NonText '^[	 ]\+'

hi VertSplit  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=yellow ctermbg=black cterm=NONE
set fillchars+=vert:│
hi clear VertSplit
highlight link VertSplit NONE
hi VertSplit  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=yellow ctermbg=black cterm=NONE

highlight LineNr ctermfg=237
highlight CursorLineNr ctermfg=242


autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234 ctermfg=NONE cterm=none term=none

highlight ExtraWhitespace ctermbg=blue

hi Comment ctermfg=DarkGrey guifg=DarkGrey
hi Search ctermbg=LightBlue guibg=LightBlue
hi ErrorMsg ctermfg=Red guibg=White guifg=Red
hi Statement ctermfg=Green guifg=LightGreen
hi Type ctermfg=yellow guifg=LightGreen
hi Keyword ctermfg=yellow guifg=LightGreen
hi Identifier ctermfg=LightBlue guifg=LightGreen
hi Label ctermfg=LightGreen guifg=LightGreen
hi goNiceOperator ctermfg=Green guifg=LightGreen
hi cBlock ctermfg=Green guifg=LightGreen

hi rainbow_r0 ctermfg=Green guifg=LightGreen
hi rainbow_r1 ctermfg=Green guifg=LightGreen
hi rainbow_r2 ctermfg=Green guifg=LightGreen
hi rainbow_r3 ctermfg=Green guifg=LightGreen
hi rainbow_r4 ctermfg=Green guifg=LightGreen
hi rainbow_r5 ctermfg=Green guifg=LightGreen

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Use grays instead of blues in 256-color terminal:
let g:GitShade_ColorGradient = "black_to_grey"
let g:GitShade_ColorWhat = "bg"
let g:GitShade_Colors_For_CTerm_256 = [ 0, 232, 233, 234, 235, 236, 237, 238, 239 ]
let g:GitShade_Linear = 1

" GitGutter setting
highlight SignColumn ctermbg=Black

let g:diminactive_use_colorcolumn = 1
let g:diminactive_use_syntax = 1

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
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

set mouse+=a
if &term =~ '^screen' || &term =~ '^rxvt' || &term =~ '^xterm'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set rtp+=~/.fzf

" Always show statusline
set laststatus=2

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

if &term =~ "xterm\\|rxvt"
  " use insert mode color
  let &t_SI = "\<Esc>]12;yellow\x7"
  " use command mode cursor otherwise
  let &t_EI = "\<Esc>]12;lime\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'


let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['go'] = ''

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['go'] }
let g:syntastic_go_golangci_lint_args = '' .
        \ '--enable-all ' .
        \ '--build-tags NO_CUDA ' .
        \ '--fast '
let g:syntastic_go_checkers = ['golangci-lint']

"let g:syntastic_c_include_dirs = ['/home/kmutch/darkcycle-sdk/cpp']
"let g:syntastic_c_check_header = 1

let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1

let g:syntastic_style_warning_symbol='!'
let g:syntastic_style_error_symbol = '⚡'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" Set a dark color for syntastic sign background
highlight SyntasticErrorSign ctermbg=NONE ctermfg=red guibg=#2a343a guifg=red
highlight SyntasticWarningSign ctermbg=NONE ctermfg=red guibg=#2a343a guifg=red
highlight SyntasticStyleWarningSign ctermbg=NONE ctermfg=142 guibg=#2a343a guifg=#ad9909
highlight SyntasticStyleErrorSign ctermbg=NONE ctermfg=142 guibg=#2a343a guifg=#ad9909

let g:colortuner_enabled = 1
let g:colortuner_vivid_mode = 0

let g:rainbow_active = 1

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=10
    augroup END
endif

"set omnifunc=syntaxcomplete#Complete
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
let g:deoplete#enable_at_startup = 1
let g:neocomplete#enable_at_startup = 1

" Set minimum syntax keyword length.
"let NeoCompleteAutoCompletionLength = 10
"let g:neocomplete#sources#syntax#min_keyword_length = 10
let g:neocomplete#auto_completion_start_length = 10
"let g:neocomplete#disable_auto_complete = 0
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"" <TAB>: completion for neocomplete.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" Check if NERDTree is open or active
"function! rc:isNERDTreeOpen()
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! rc:syncTree()
"  if &modifiable && rc:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"   wincmd p
"  endif
"endfunction

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

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call rc:syncTree()

"autocmd VimEnter * TagbarToggle
"autocmd VimEnter * call DWM_AutoEnter()
"autocmd VimEnter * NERDTreeFocusToggle
"autocmd VimEnter * NERDTreeFocusToggle
let g:nerdtree_tabs_open_on_console_startup=0
let g:NERDTreeHijackNetrw=1
"let g:nerdtree_tabs_smart_startup_focus=2
let g:NERDTreeWinPos = "topleft"

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim-NERDTreeBookmarks")
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

let g:goldenview__enable_default_mapping = 0
let g:goldenview__enable_at_startup = 0

nmap <F3> :NERDTreeToggle %<CR>
nmap <F5> :make<CR>:copen<CR>

nnoremap <silent> <F2>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <F2>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>

" SQL Related items
au BufNewFile,BufRead *.sql setf pgsql

" Go Specific Stuff

au BufRead,BufNewFile *.go set filetype=go
autocmd FileType go setlocal softtabstop=4
autocmd FileType go setlocal shiftwidth=4
autocmd FileType go setlocal tabstop=4
" autocmd FileType qf wincmd J

let g:go_list_type = "locationlist"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_bin_path = expand("~/go/bin")

" go-vim settings
let g:go_fmt_command = "goimports"
"let g:go_fmt_command = "gofmt"
let g:go_autodetect_gopath = 1

" Enable syntax highting on everything
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_auto_type_info = 1
let g:go_debug_mode = "gopls"
let g:go_info_mode = "gopls"

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_def_mapping_enabled = 1
let g:go_code_completion_enabled = 1

let g:go_metalinter_command = "golangci-lint run --build-tags NO_CUDA "
let g:go_metalinter_autosave = 1
let g:go_jump_to_error = 0

" go-def settings
let g:godef_split=2
let g:godef_same_file_in_same_window=1

if !exists("g:go_conceal")
  let g:go_conceal = 1
endif

let g:go_build_tags = "NO_CUDA"

" from https://gist.github.com/tyru/984296
" Substitute a:from => a:to by string.
" To substitute by pattern, use substitute() instead.
function! s:substring(str, from, to)
  if a:str ==# '' || a:from ==# ''
      return a:str
  endif
  let str = a:str
  let idx = stridx(str, a:from)
  while idx !=# -1
      let left  = idx ==# 0 ? '' : str[: idx - 1]
      let right = str[idx + strlen(a:from) :]
      let str = left . a:to . right
      let idx = stridx(str, a:from)
  endwhile
  return str
endfunction

function! s:chomp(string)
  return substitute(a:string, '\n\+$', '', '')
endfunction

function! s:go_guru_scope_from_git_root()
" chomp because get rev-parse returns line with newline at the end
  return s:chomp(s:substring(system("git rev-parse --show-toplevel"),$GOPATH . "/src/","")) . "/..."
endfunction

au FileType go silent exe "GoGuruScope " . s:go_guru_scope_from_git_root()

" UTF-8 Based concealment of common operators
if g:go_conceal != 0
    syn match goNiceOperator "<-" conceal cchar=←
    syn match goNiceOperator "->" conceal cchar=→
    syn match goNiceOperator "!=" conceal cchar=≠
    syn match goNiceOperator ":=" conceal cchar=≔
endif

hi link goNiceOperator goOperator
hi! link Conceal Operator
setlocal conceallevel=2

let g:SOURCEGRAPH_AUTO = "false"

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

" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
"nmap <silent> <C-'>  <Plug>GoldenViewNext
"nmap <silent> <C-;>  <Plug>GoldenViewPrevious

let g:clang_format#detect_style_file = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

"  Accidentally hitting unwanted keys in normal mode:
nnoremap <F1> <nop>
" lets do the same for insert mode!!!
inoremap <F1> <nop>

" Allow more uses of backspace key:
"  Can't backspace past start of operation:
set backspace=indent,eol,start

"
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

"au Filetype go set makeprg=go\ install\ ./...

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif

" Hostname configurations
let hostfile=$HOME.'/.vim/machine/' . hostname() . '.vim'
if filereadable(hostfile)
        exe 'source ' . hostfile
    endif

source ~/.vim/autoload/SyntaxAttr.vim
"
"" This is only necessary if you use "set termguicolors".
"set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" fixes glitch? in colors when using vim with tmux
set background=dark
"let g:nofrils_strbackgrounds = 1
"colorscheme nofrils-knm
colorscheme nofrils-knm

set foldmethod=syntax
set foldlevelstart=20

"augroup AutoSaveFolds
"  autocmd!
"  autocmd BufWinLeave *.* mkview!
"  autocmd BufWinEnter *.* silent loadview
"augroup END

set viewoptions-=options
"set viewoptions=cursor,folds,slash,unix
let g:skipview_files = ['*\.vim']

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    " so that it works when relativenumber has been set
    if (&relativenumber)
        let nucolwidth = &fdc + &relativenumber * &numberwidth
    else
        let nucolwidth = &fdc + &number * &numberwidth
    endif

    let windowwidth = winwidth(0) - nucolwidth - 6
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' …'
endfunction " }}}
set foldtext=MyFoldText()

set viminfo+='1000,f1,\"512,:32,%
