
" Colors and scheme changes
"

match NonText '^[	 ]\+'
hi NonText  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=234 ctermbg=black cterm=NONE
hi clear SpecialKey
hi link SpecialKey NonText
    
autocmd FileType go hi NonText guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=234 ctermbg=black cterm=NONE
autocmd FileType go match NonText '^[	 ]\+'

hi VertSplit  guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE ctermfg=yellow ctermbg=black cterm=NONE
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

" Use grays instead of blues in 256-color terminal:
let g:GitShade_ColorGradient = "black_to_grey"
let g:GitShade_ColorWhat = "bg"
let g:GitShade_Colors_For_CTerm_256 = [ 0, 232, 233, 234, 235, 236, 237, 238, 239 ]
let g:GitShade_Linear = 1

hi Cursor               ctermfg=green         ctermbg=green
hi iCursor              ctermfg=red         ctermbg=red

" Set a dark color for syntastic sign background
highlight SyntasticErrorSign ctermbg=NONE ctermfg=red guibg=#2a343a guifg=red
highlight SyntasticWarningSign ctermbg=NONE ctermfg=red guibg=#2a343a guifg=red
highlight SyntasticStyleWarningSign ctermbg=NONE ctermfg=142 guibg=#2a343a guifg=#ad9909
highlight SyntasticStyleErrorSign ctermbg=NONE ctermfg=142 guibg=#2a343a guifg=#ad9909


 " Inactive window background
 hi ColorColumn ctermfg=white ctermbg=NONE guibg=#eee8d5

