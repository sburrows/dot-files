" Vim color file
" Maintainer:	Steve Burrows
" Last Change:	2011 July 01

set background=dark
hi clear

let colors_name = "steve"

" Normal should come first
hi Normal     guifg=Black  guibg=White
hi Cursor     cterm=NONE ctermbg=lightgray ctermfg=NONE guifg=bg     guibg=fg
hi lCursor    guifg=NONE   guibg=Cyan
hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=NONE guibg=darkred guifg=white

" Note: we never set 'term' because the defaults for B&W terminals are OK
hi DiffAdd    ctermbg=LightBlue    guibg=LightBlue
hi DiffChange ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete ctermfg=Blue	   ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
hi DiffText   ctermbg=Red	   cterm=bold gui=bold guibg=Red
hi Directory  ctermfg=DarkBlue	   guifg=Blue
hi ErrorMsg   ctermfg=White	   ctermbg=DarkRed  guibg=Red	    guifg=White
hi FoldColumn ctermfg=DarkBlue	   ctermbg=Grey     guibg=Grey	    guifg=DarkBlue
hi Folded     ctermbg=Grey	   ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi IncSearch  cterm=reverse	   gui=reverse
hi LineNr     ctermfg=Brown	   guifg=Brown
hi ModeMsg    cterm=bold	   gui=bold
hi MoreMsg    ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi NonText    ctermfg=Blue	   gui=bold guifg=gray guibg=white
hi Pmenu      guibg=LightBlue
hi PmenuSel   ctermfg=White	   ctermbg=DarkBlue  guifg=White  guibg=DarkBlue
hi Question   ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi Search     ctermfg=NONE	   ctermbg=Yellow guibg=Yellow guifg=NONE
hi SpecialKey ctermfg=DarkBlue	   guifg=Blue
hi StatusLine cterm=bold	   ctermbg=brown ctermfg=white guibg=gold guifg=blue
hi StatusLineNC	cterm=bold	   ctermbg=black ctermfg=grey  guibg=gold guifg=blue
hi Title      ctermfg=DarkMagenta  gui=bold guifg=Magenta
hi VertSplit  cterm=reverse	   gui=reverse
hi Visual     ctermbg=NONE	   cterm=reverse gui=reverse guifg=Grey guibg=fg
hi VisualNOS  cterm=underline,bold gui=underline,bold
hi WarningMsg ctermfg=DarkRed	   guifg=Red
hi WildMenu   ctermfg=Black	   ctermbg=Yellow    guibg=Yellow guifg=Black

" syntax highlighting
"hi Comment    cterm=NONE ctermfg=DarkRed     gui=NONE guifg=red2
hi Comment    cterm=NONE ctermfg=DarkCyan    gui=NONE guifg=darkcyan
hi Constant   cterm=NONE ctermfg=DarkGreen   gui=NONE guifg=green3
hi Identifier cterm=bold ctermfg=Green       gui=bold guifg=grey4
hi PreProc    cterm=NONE ctermfg=DarkMagenta gui=NONE guifg=magenta3
hi Special    cterm=NONE ctermfg=DarkRed     gui=NONE guifg=deeppink
hi Statement  cterm=bold ctermfg=Yellow      gui=bold guifg=darkkhaki
hi Type	      cterm=NONE ctermfg=Yellow      gui=bold guifg=darkkhaki
"hi Underlined
hi Ignore	guifg=grey40
"hi Error
hi Todo	     cterm=none ctermfg=White ctermbg=DarkBlue gui=none guifg=white guibg=darkblue

" vim: sw=2
