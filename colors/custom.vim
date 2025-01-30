" custom color scheme

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "custom"
set background=dark

hi! Normal      guibg=#053230 guifg=#d1b897
"hi! Normal      guibg=#053230 guifg=#d3b58d
"hi! Normal      guibg=#053230 guifg=#f8efd8
hi! EndOfBuffer guibg=#053230 guifg=#D3B58D

hi! Comment guifg=#3DDF23
hi! Identifier guifg=#d1b897
hi! PreProc guifg=#f8efd8
hi! Function guifg=#d1b897
hi! Constant guifg=#d1b897
hi! Number guifg=#0FDFAF
hi! String guifg=#0FDFAF
hi! Character guifg=#0FDFAF
hi! Boolean guifg=#0FDFAF
hi! Float guifg=#0FDFAF
hi! CursorLine guibg=#154240
hi! Keyword guifg=#f8efd8 gui=NONE
hi! Statement guifg=#f8efd8 gui=NONE
hi! Operator guifg=#d3b58d gui=NONE
hi! Type guifg=#7ad0c6 gui=NONE
hi! Visual guibg=#0000ff gui=NONE

hi! DiffAdd guibg=#053230 guifg=#6b8e23
hi! DiffDelete guibg=#053230 guifg=#ff0000
hi! DiffChange guibg=#053230 guifg=#ac7b0b

hi! Todo guibg=#053230 guifg=#6b8e23
hi! TodoBgTODO guibg=#053230
hi! TodoBgFIX guibg=#053230
hi! TodoBgNOTE guibg=#053230
hi! TodoBgHACK guibg=#053230

hi! TodoFgTODO guifg=#ff0000
hi! TodoFgFIX guifg=#ff0000
hi! TodoFgNOTE guifg=#00a000
hi! TodoFgPERF guifg=#00a000
hi! TodoFgTEST guifg=#00a000
hi! TodoFgHACK guifg=#ff0000

hi! cErrInparen guifg=Normal
hi! @variable guifg=Normal
hi! DiagnosticUnnecessary guifg=Normal

"hi Search guibg=#315268 guifg=#c4b82b
"hi IncSearch guibg=#315268 guifg=#c4b82b
"hi Keyword guifg=#FFFFFF gui=NONE
"hi Statement guifg=#FFFFFF gui=NONE
"hi String guifg=#0FDFAF
"hi Number guifg=#D699B5
"hi PreProc guifg=#dab98f
"hi Character guifg=#0FDFAF
"hi Boolean guifg=#7FFFD4
"hi Integer guifg=#D699B5
"hi Float guifg=#D699B5
"hi Include guifg=#dab98f
"hi SpecialKey guifg=#a00000
"hi SpecialChar guifg=#d3b58d
"hi SpecialComment guifg=#00a000
"hi LineNr guibg=#001f1f guifg=#404040
"hi CursorLineNr guibg=#001f1f guifg=#808080
"hi Visual guibg=#0000ff gui=NONE
"hi Operator guifg=#d3b58d
"hi @variable guifg=#d3b58d
"
"hi Pmenu guibg=#0C0C0C guifg=#d3b58d
"hi PmenuSel guibg=#1f1f27
"
"hi Title guifg=#6b8e23 gui=NONE
"hi SignColumn guibg=#101010 guifg=#d3b58d gui=NONE
"hi Whitespace guifg=#d3b58d gui=NONE
"hi EndOfBuffer guifg=#d3b58d gui=NONE
"hi NonText guifg=#d3b58d gui=NONE
"hi Directory guifg=#6b8e23 gui=NONE
"hi Function guifg=d3b58d gui=NONE
"hi Type guifg=#98FB98 gui=NONE
"hi Macro guifg=#478980 gui=NONE
"hi MatchParen guibg=#3c3c3c gui=NONE
"hi StatusLine guibg=#1f1f27 guifg=#cb9401 gui=NONE
"hi StatusLineNC guibg=#1f1f27 guifg=#d3b58d gui=NONE
"
"
