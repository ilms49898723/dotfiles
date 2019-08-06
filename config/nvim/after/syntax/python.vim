" Additional Python syntax definitions
"
" Author: LittleBird

" Add builtin object keywords
syn keyword pythonBuiltinObj __future__

" Highlighting class variables
hi link pythonClassVar Macro

" Highlighting Shebang and file encoding line
hi link pythonCoding Special
hi link pythonRun Special

" Highlighting format strings
hi link pythonStrFormat Identifier
hi link pythonStrFormatting Identifier
hi link pythonStrInterpRegion Identifier
hi link pythonStrTemplate Identifier
