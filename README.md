
<h3 align="center">
Neovim Lua configuration No 02 (based on kickstart.nvim)
</h3>

This repository contains my config files for Neovim.  \
Configuring Neovim using Lua programming language
(switching from init.vim to init.lua)

------------------------------------------------------------
### A:  kickstart.nvim

https://github.com/nvim-lua/kickstart.nvim  \
Michael Lingelbach - mjlbach  \
About: A small, documented, and featureful neovim starter config

This repo is meant to be used as a starting point for a user's own configuration;
remove the things you don't use and add what you miss.

Info:
https://github.com/neovim/neovim/projects  \
--> @mjlbach, @folke, @mfussenegger, @tjdevries, @bfredl, ...

------------------------------------------------------------
## B:  How I got "kickstart.nvim_config_02"?

https://github.com/mlabrkic/kickstart.nvim_config_01   \
\+
new (No_ 06 -  No_ 07)

### No_ 06:  Lualine Statusline:  'nvim-lualine/lualine.nvim'
```lua
  -- statusline, mlabrkic:

  -- use 'nvim-lualine/lualine.nvim'                                              -- Fancier statusline

  -- https://github.com/nvim-lualine/lualine.nvim#packernvim
  -- You'll also need to have a patched font if you want icons.
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

------------------------------
  -- https://github.com/SmiteshP/nvim-gps
  -- ⚠️ Deprecated! Use nvim-navic instead of this plugin

  -- https://github.com/SmiteshP/nvim-navic
  -- Simple statusline component that shows what scope you are working inside
  -- ... but uses LSP instead of Treesitter.
  use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }

------------------------------
  -- use 'arkav/lualine-lsp-progress'
  -- Choose  'j-hui/fidget.nvim' instead of 'arkav/lualine-lsp-progress'

  -- Standalone UI for nvim-lsp progress
  -- After the plugin is loaded (e.g., after plug#end() for vim-plug),
  -- call its setup function (in Lua):  require('fidget').setup{}
  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup{}
    end
  }
```

```lua
-- 1) statusline:  lualine

-- require('SL/lualine')
require('SL/lualine_nvim-navic')
```

### No_ 07:  Vimscript Statusline
```lua
-- 2) statusline:  vimscript

-- :h variable-scope

-- vim.cmd [[
--   augroup AU_statusline
--     autocmd!
--     " let g:path_to_source = stdpath("config") . "\\" . "SL\\statusline_ternary.vim"
--     let g:path_to_source = stdpath("config") . "\\" . "SL\\statusline.vim"
--     autocmd VimEnter * execute "source" g:path_to_source
--   augroup end
-- ]]
```

