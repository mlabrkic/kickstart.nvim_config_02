" vim, whats-the-best-way-to-set-statusline-color-to-change-based-on-mode:
" https://stackoverflow.com/questions/48271865/vim-whats-the-best-way-to-set-statusline-color-to-change-based-on-mode

" ------------------------------
" Showing the statusline
" First ensure that the status bar is enabled all the time.
" set laststatus=2

" Then set the statusline
" A useful pattern to use when building a statusline is to concatenate the line and
" build the statusline over multiple lines in your vimrc.

set noshowmode

" ------------------------------
" hi StatusLine           ctermfg=253         ctermbg=233         cterm=bold
" hi StatusLineNormal     ctermfg=251         ctermbg=26          cterm=bold
" hi StatusLineInsert     ctermfg=251         ctermbg=22          cterm=bold
" hi StatusLineReplace    ctermfg=251         ctermbg=88          cterm=bold
" hi StatusLineVisual     ctermfg=251         ctermbg=130         cterm=bold
" hi StatusLineVisualL    ctermfg=251         ctermbg=130         cterm=bold
" hi StatusLineVisualB    ctermfg=251         ctermbg=130         cterm=bold
" hi StatusLineCommand    ctermfg=251         ctermbg=26          cterm=bold
" hi StatusLineSelect     ctermfg=251         ctermbg=130         cterm=bold
" hi StatusLineSelectL    ctermfg=251         ctermbg=130         cterm=bold
" hi StatusLineSelectB    ctermfg=251         ctermbg=130         cterm=bold
" hi StatusLineTerminal   ctermfg=251         ctermbg=22          cterm=bold

" ------------------------------
" colors, lualine

" highlight MyStLineNormal guifg=colors["fg1"] guibg=colors["color4"] gui=bold
highlight MyStLineNormal guifg=#282828 guibg=#a89984

" highlight MyStLineInsert guifg=colors["fg1"] guibg=colors["color6"] gui=bold
highlight MyStLineInsert guifg=#282828 guibg=#a9b665

" highlight MyStLineVisual guifg=colors["fg1"] guibg=colors["color9"] gui=bold
highlight MyStLineVisual guifg=#282828 guibg=#ea6962

" highlight MyStLineReplace guifg=colors["fg1"] guibg=colors["color7"] gui=bold
highlight MyStLineReplace guifg=#282828 guibg=#d8a657

" highlight MyStLineCommand guifg=colors["fg1"] guibg=colors["color5"] gui=bold
highlight MyStLineCommand guifg=#282828 guibg=#7daea3

" highlight MyStLineTerminal guifg=colors["fg1"] guibg=colors["color8"] gui=bold
highlight MyStLineTerminal guifg=#282828 guibg=#d3869b

" highlight MyEnd guifg=#282828 guibg=#696969

" ------------------------------
" https://www.w3schools.com/colors/colors_rgb.asp
" https://www.w3schools.com/colors/colors_hex.asp

" ------------------------------
" :h hl-StatusLine
" h hl-Pmenu

" hi StatusLine
" hi Pmenu

" hi MyStLineNormal
" hi MyStLineVisual
" hi MyStLineTerminal

" ------------------------------
    " \ 'n' : {
        " \ 'text'        : 'NORMAL',
        " \ 'color_group' : 'MyStLineNormal'
" or
        " \ 'color_group' : 'Statusline'

" ------------------------------
let s:statusline_modes_dict = {
    \ 'n' : {
        \ 'text'        : 'NORMAL',
        \ 'color_group' : 'Statusline'
    \ },
    \ 'i' : {
        \ 'text'        : 'INSERT',
        \ 'color_group' : 'MyStLineInsert'
    \ },
    \ 'R' : {
        \ 'text'        : 'REPLACE',
        \ 'color_group' : 'MyStLineReplace'
    \ },
    \ 'v' : {
        \ 'text'        : 'VISUAL',
        \ 'color_group' : 'MyStLineVisual'
    \ },
    \ 'V' : {
        \ 'text'        : 'V-LINE',
        \ 'color_group' : 'MyStLineCommand'
    \ },
    \ "\<C-v>" : {
        \ 'text'        : 'V-BLOCK',
        \ 'color_group' : 'MyStLineCommand'
    \ },
    \ 'c' : {
        \ 'text'        : 'COMMAND',
        \ 'color_group' : 'MyStLineCommand'
    \ },
    \ 's' : {
        \ 'text'        : 'SELECT',
        \ 'color_group' : 'StatusLineSelect'
    \ },
    \ 'S' : {
        \ 'text'        : 'S-LINE',
        \ 'color_group' : 'StatusLineSelectL'
    \ },
    \ "\<C-s>" : {
        \ 'text'        : 'S-BLOCK',
        \ 'color_group' : 'StatusLineSelectB'
    \ },
    \ 't' : {
        \ 'text'        : 'TERMINAL',
        \ 'color_group' : 'MyStLineTerminal'
    \ },
\ }

function Get_current_mode_text ()
    let md = mode()
    if (has_key (s:statusline_modes_dict, md))
        return s:statusline_modes_dict[md]['text']
    endif
    return md
endfunction

function Get_current_mode_color_group ()
    let md = mode()
    if (has_key (s:statusline_modes_dict, md))
        return "%#" . s:statusline_modes_dict[md]['color_group'] . "#"
    endif
    return "%#StatusLine#"
endfunction

" ------------------------------
" left
set statusline=
set statusline+=%#Pmenu#               " colour
" set statusline+=%#MyEnd# 
" set statusline+=\ %#Statusline#        " colour
set statusline+=\ %{%Get_current_mode_color_group()%}
set statusline+=\ %{Get_current_mode_text()}

" ------------------------------
" Restore normal highlight with %* or %0*.
set statusline+=\ %*
" set statusline+=\ %#Statusline#

set statusline+=%#Pmenu#               " colour
set statusline+=\Buf:%n        " Buffer number
set statusline+=\ Col:%-c      " column 
set statusline+=%#Statusline#          " colour
" set statusline+=\ %f         " Path to the file in the buffer, as typed or relative to current directory.
set statusline+=\ %.30F         " F  Full path to the file in the buffer.

set statusline+=\ %#Pmenu#             " colour
" https://github.com/SmiteshP/nvim-navic#native-method
set statusline+=%{%v:lua.require'nvim-navic'.get_location()%}

set statusline+=%m           " Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
set statusline+=%#Statusline#          " colour

" ------------------------------
set statusline+=%=           " =  Separation point between alignment sections.
" ------------------------------
"  right

" set statusline+=\ %{v:register}  " which copy/paste buffer (register) is currently active
set statusline+=\ %r         " Readonly flag, text is "[RO]".
set statusline+=\ %b         " Value of character under cursor.
set statusline+=\ %#Pmenu#             " colour
set statusline+=(%l/%L)   " line ( L  Number of lines in buffer ).
set statusline+=\ %2p%%

set statusline+=%#Statusline#          " colour
" set statusline+=%{&bomb?'[BOM]':''}
set statusline+=%{&bomb?'\ BOM':''}
set statusline+=\ %y         " Type of file in the buffer, e.g., "[vim]".  See 'filetype'.
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}]

" set statusline+=%#MyEnd# 
set statusline+=%#Pmenu#               " colour
set statusline+=\ |


" ##############################################################

" colors, lualine

" Windows Command Shell:
" echo %USERPROFILE%
" echo %LOCALAPPDATA%

" %USERPROFILE%\AppData\Local
" \nvim-data\site\pack\packer\start
" \lualine.nvim\lua\lualine\themes\gruvbox-material.lua

" let g:colors={
" \ 'fg1'    : '#282828',
" \ 'color2' : '#504945',
" \ 'fg2'    : '#ddc7a1',
" \ 'color3' : '#32302f',
" \ 'color4' : '#a89984',
" \ 'color5' : '#7daea3',
" \ 'color6' : '#a9b665',
" \ 'color7' : '#d8a657',
" \ 'color8' : '#d3869b',
" \ 'color9' : '#ea6962',
" \}

" return {
"   normal = {
"     a = { fg = colors.fg1, bg = colors.color4, gui = 'bold' },
"     b = { fg = colors.fg2, bg = colors.color2 },
"     c = { fg = colors.fg2, bg = colors.color3 },
"   },
"   command = { a = { fg = colors.fg1, bg = colors.color5, gui = 'bold' } },
"   inactive = { a = { fg = colors.fg2, bg = colors.color2 } },
"
"   insert = { a = { fg = colors.fg1, bg = colors.color6, gui = 'bold' } },
"   replace = { a = { fg = colors.fg1, bg = colors.color7, gui = 'bold' } },
"   terminal = { a = { fg = colors.fg1, bg = colors.color8, gui = 'bold' } },
"   visual = { a = { fg = colors.fg1, bg = colors.color9, gui = 'bold' } },
" }

" ------------------------------------------------------------

