" Additional Python syntax definitions
"
" Author: LittleBird

" Add builtin object keywords
syn keyword pythonBuiltin __doc__ __file__ __name__ __package__ __future__

" Add 'self' to keywords
syn keyword pythonSelfStatement self

" Highlighting
hi def link pythonSelfStatement Macro

" Shebang line and coding
syn match pythonRun "\%^#!.*$"
syn match pythonCoding "\%^.*\%(\n.*\)\?#.*coding[:=]\s*[0-9A-Za-z-_.]\+.*$"

" Highlighting
hi def link pythonRun Identifier
hi def link pythonCoding Identifier

" Python Errors
syn match pythonError "\<\d\+\D\+\>" display
syn match pythonError "[$?]" display
syn match pythonError "[&|]\{2,}" display
syn match pythonError "[=]\{3,}" display

" Highlighting
hi def link pythonError Error

" % format strings
syn match pythonStrFormatting "%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString
syn match pythonStrFormatting "%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString

" Highlighting
hi def link pythonStrFormatting Identifier

" str.format() format strings
syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonRawString
syn match pythonStrFormat "{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonRawString

" Highlighting
hi def link pythonStrFormat Identifier

" string.template format strings
syn match pythonStrTemplate "\$\$" contained containedin=pythonString,pythonRawString
syn match pythonStrTemplate "\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonRawString
syn match pythonStrTemplate "\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonRawString

" Highlighting
hi def link pythonStrTemplate Identifier
