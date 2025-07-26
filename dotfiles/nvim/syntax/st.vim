" Vim Syntax File
" Language: MotionWorks Structured Text
" Maintainer: Nathan Scheinkman

if exists("b:current_syntax")
    finish
endif

syn case ignore

syn keyword stBoolean true false
syn keyword stType string bool sint int dint lint usint uint udint ulint real lreal time byte word dword
syn keyword stConditional if else elsif end_if then
syn keyword stBoolOperator and or not
syn keyword stBlockStatement var end_var var_input var_in_out var_output var_external program function_block end_function_block
syn keyword stKeyword return case of for to by do end_for

syn region stComment start="(\*\|{" end="\*)\|}"
syn region stString	start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	

syn match stHash "#"
syn match stNumber "\<0[bB][0-1]\+\(_[0-1]\+\)*\>"
syn match stNumber "\<0[oO][0-7]\+\(_[0-7]\+\)*\>"
syn match stNumber "\<0\([0-7]\+\(_[0-7]\+\)*\)\?\>"
syn match stNumber "\<0[xX][0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>"
syn match stNumber "\<\d\+\(_\d\+\)*[eE][+-]\?\d\+\>"
syn match stNumber "\<[1-9]\d*\(_\d\+\)*\(\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\)\?\>"
syn match stNumber "\<\(\d\+\(_\d\+\)*\)\?\.\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\>"
syn match stNumber "\<\d\+\(_\d\+\)*\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\>"

syn match stOperator ":="

syn match stTodo "\<TODO\>" containedin=stComment

hi def link stComment Comment
hi def link stBoolOperator Operator
hi def link stOperator Operator
hi def link stBoolean Boolean
hi def link stType Type
hi def link stNumber Number
hi def link stFloat Float
hi def link stConditional Conditional
hi def link stBlockStatement Statement
hi def link stKeyword Keyword
hi def link stTodo Todo
hi def link stString String

let b:current_syntax="st"
