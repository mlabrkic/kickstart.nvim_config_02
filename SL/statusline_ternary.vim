" https://dustri.org/b/lightweight-and-sexy-status-bar-in-vim.html

" you have to escape spaces with \
" everything between %{…} will be evaluated
" you can set colours with %#your_colour_name#
" everything you need to know is in
" :help statusline

" --------------
" :h ternary
" Ternary Expression
" Vim has a ternary expression for a one-liner case analysis:

" {predicate} ? expressiontrue : expressionfalse
" echo 1 ? "I am true" : "I am false"
" let &background = strftime("%H") < 18 ? "light" : "dark"

" --------------
" set laststatus=2
set noshowmode

" --------------
function! IsCv()
  return "\<C-v>" == mode()  " because \" is a comment, we need a function for this…
endfunction

set statusline=
set statusline+=%#Search#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffAdd#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#DiffChange#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#DiffChange#%{(IsCv())?'\ \ VISUAL\ ':''}
set statusline+=%#Cursor#        " colour
set statusline+=\ %n\            " buffer number
set statusline+=%#Visual#        " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#      " colour
set statusline+=%w               " preview flag
set statusline+=%h               " help flag
set statusline+=%r               " readonly flag
set statusline+=%m               " modified [+] flag
set statusline+=%#CursorLine#    " colour
set statusline+=\ %t\            " short file name
set statusline+=%=               " right align
set statusline+=%#CursorLine#    " colour
set statusline+=\ %{&filetype}\  " file type (%Y and %y are too ugly)
set statusline+=%#Visual#        " colour
set statusline+=\ %3l:%-2c\      " line + column
set statusline+=%#Cursor#        " colour
set statusline+=\ %3p%%\         " percentage
set statusline+=%#CursorLine#    " colour


" ##############################################################

" :help statusline
" Statuslines in Vim are not hard to create.

" The option consists of printf style '%' items interspersed with normal text.
" Each status line item is of the form:
" %-0{minwid}.{maxwid}{item}

" Everything except the % and the item is optional.

" ------------------------------------------------------------
" No_ 01:
" Hello World statusline:

" Showing the statusline
" First ensure that the status bar is enabled all the time.
" set laststatus=2

" Then set the statusline
" A useful pattern to use when building a statusline is to concatenate the line and
" build the statusline over multiple lines in your vimrc.

" set statusline=
" set statusline+=\ %f
" set statusline+=%=                          " right align
" set statusline+=hello
" set statusline+=\ world

" Try it:
" :set statusline= | set statusline+=\ %f | set statusline+=%= | set statusline+=hello | set statusline+=\ world

" ------------------------------------------------------------
"  No_ 02:
" https://learnvimscriptthehardway.stevelosh.com/chapters/17.html

" Width and Padding:

" :set statusline=[%4l]
" at least four characters wide, for example: [  12]

" You can use "-" to place padding on the right instead of the left.
" Run this command:
" :set statusline=Current:\ %-4l\ Total:\ %-4L

" Your status line will now look like this:
" Current: 12   Total: 223

" ------------------------------------------------------------
"  No_ 03:
"  HELP:

" h highlight

" ------------------------------
" You can see all the groups currently active with this command: >
" :so $VIMRUNTIME/syntax/hitest.vim

" :colo[rscheme]	Output the name of the currently active color scheme.

" :hi[ghlight]		List all the current highlight groups that have attributes set.
" :hi[ghlight] clear	Reset all highlighting to the defaults.  Removes all highlighting for groups added by the user!

" :verbose hi Comment  " the listing will also tell where it was last set.

" ------------------------------
" h highlight-args

" There are two types of UIs for highlighting:
" cterm	terminal UI (|TUI|)
" gui	GUI or RGB-capable TUI ('termguicolors')

" ------------------------------
" 1. TUI highlight arguments
" h highlight-cterm

" h ctermfg

" h ctermbg
" ctermbg={color-nr}				*highlight-ctermbg*

" h cterm-colors

" :highlight Normal ctermfg=grey ctermbg=darkblue
" :highlight Visual ctermfg=bg ctermbg=fg

" ------------------------------
" 2. GUI highlight arguments
" h highlight-gui

" h highlight-guifg
" guifg={color-name}					*highlight-guifg*
" :hi comment guifg='salmon pink'

" foreground (guifg), background (guibg)

" --------------
" h gui-colors
" You can also specify a color by its RGB (red, green, blue) values.
" The format is "#rrggbb", where
" 	"rr"	is the Red value
" 	"gg"	is the Green value
" 	"bb"	is the Blue value

" All values are hexadecimal, range from "00" to "ff".  Examples: >
" :highlight Comment guifg=#11f0c3 guibg=#ff00ff

" --------------
" h highlight-groups

" These are the builtin highlighting groups.  
" Note that the highlighting depends on the value of 'background'.  
" You can see the current settings with the
":highlight" command.

" --------------
" h hl-Search
" h hl-DiffAdd
" h hl-DiffDelete
" h hl-DiffChange
" h hl-Cursor
" h hl-Vlsual
" h hl-CursorIM
" h hl-CursorLine
" h hl-Cursor

" ------------------------------------------------------------

