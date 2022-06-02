" :h ginit.vim

" ----------------------------------------------------------
" https://github.com/equalsraf/neovim-qt#configuration

" Neovim Qt can be configured through the ginit.vim file.
" Windows: %LOCALAPPDATA%\nvim\ginit.vim

" Windows Command shell:  echo %LOCALAPPDATA%

" ----------------------------
" Recommended ginit.vim:

" Enable Mouse
" set mouse=a

" Set Editor Font
" if exists(':GuiFont')
"     " Use GuiFont! to ignore font errors
"     GuiFont {font_name}:h{size}
" endif

" Disable GUI Tabline
" if exists(':GuiTabline')
"     GuiTabline 0
" endif

" Disable GUI Popupmenu
" if exists(':GuiPopupmenu')
"     GuiPopupmenu 0
" endif

" Enable GUI ScrollBar
" if exists(':GuiScrollBar')
"     GuiScrollBar 1
" endif

" ----------------------------------------------------------
" https://jdhao.github.io/2019/01/17/nvim_qt_settings_on_windows/

" Nvim-qt Settings on Windows 10

" To run Neovim on Windows, you can either use the terminal Neovim or use a GUI for Neovim.
" If you use terminal Nvim, you may encounter various annoying issues.
" Based on my experience, I recommend you using a GUI client for Nvim instead of the terminal one.

" Nvim-qt is one of the many GUI front end for Neovim, and it is packaged with Neovim by default on Windows platform.
" In this post, I will give a summary on how to solve a few issues with Nvim-qt.

" ----------------------------
" GUI settings - ginit.vim
" ----------------------------

" Nvim-qt has also provided a list of its own command to configure its behaviors.
" I list some of the settings in the following sections.

" ----------------------------
" How to change the font used?

" You can change the font Nvim-qt uses by default.
" To check the default font used, use GuiFont command without argument inside nvim-qt.
" On my system, the output is Consolas:h11.
" :GuiFont

" According to nvim-qt documentation, the following attributes for fonts are available:
" hXX - height is XX in points
" b   - bold weight
" l   - light weight
" i   - italic
" GuiFont Hack:h10:l

" After issuing the above command, you may see the following warning message:
" Warning : Font “Hack” reports bad fixed pitch metrics.
" To suppress this message, use the bang version of GuiFont command instead:
" :GuiFont! Hack:h10:l

" ----------------------------
" Download free fonts

" https://github.com/ryanoasis/nerd-fonts/releases/
" Assets 54
" -->
" I installed SourceCodePro:
" SourceCodePro.zip
" Info: Monospaced font family for user interface and coding environments

" -->
" SourceCodePro-Regular.ttf

" ----------------------------
" How to install fonts in Windows 10?
" https://support.microsoft.com/en-us/office/add-a-font-b7c5f17c-4426-4b53-967f-455339c564c1

" Download the font files. ...
" If the font files are zipped, unzip them by right-clicking the . ...
" Right-click the fonts you want, and click Install.

" -->
"  In Windows 10, go to Control Panel > Fonts
"Control Panel\All Control Panel Items\Fonts\Source Code Pro

" ----------------------------
"^D is CTRL-D

" ----------------------------------------------------------
if exists('g:GuiLoaded')
    " https://github.com/ryanoasis/nerd-fonts/releases/
    " Sauce Code Pro Nerd Font
    " SauceCodePro NF
    " Guifont! SauceCodePro NF:h14:cEASTEUROPE
    Guifont! SauceCodePro NF:h16:cEASTEUROPE

    nmap <C-0> :Guifont! SauceCodePro NF:h16:cEASTEUROPE<CR>
    nmap <C-1> :Guifont! SauceCodePro NF:h18:cEASTEUROPE<CR>
    nmap <C-2> :Guifont! SauceCodePro NF:h20:cEASTEUROPE<CR>

    call GuiWindowMaximized(1)
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
endif

