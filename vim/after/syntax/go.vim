
if !exists("g:go_conceal")
  let g:go_conceal = 1
endif
" UTF-8 Based concealment of common operators
if g:go_conceal != 0
    syn match goNiceOperator "<-" conceal cchar=←
    syn match goNiceOperator "->" conceal cchar=→
    syn match goNiceOperator "!=" conceal cchar=≠
    syn match goNiceOperator ":=" conceal cchar=≔
    syn match goNiceOperator ">=" conceal cchar=≥
    syn match goNiceOperator "<=" conceal cchar=≤
endif

hi link goNiceOperator goOperator
hi! link Conceal Operator
setlocal conceallevel=2

