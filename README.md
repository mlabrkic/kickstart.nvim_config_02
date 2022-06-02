
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

https://github.com/mlabrkic/kickstart.nvim_config_01 

+

new (No_ 06 -  No_ 07)

------------------------------
#### No_ 06:  Plugins

Plugins:  'numToStr/Comment.nvim', 'nvim-lualine/lualine.nvim'

```lua
  -- use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines ("gcc" to comment one line)
  -- When you call setup() method, "Comment.nvim" sets up some basic mapping (default).
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup{}  -- mlabrkic: () --> {}
      end
  }
```

```lua
  ----------------------------
  -- https://github.com/nvim-lualine/lualine.nvim
  -- use 'nvim-lualine/lualine.nvim' -- Fancier statusline

  -- mlabrkic
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- https://github.com/SmiteshP/nvim-gps
  -- Simple statusline component that shows what scope you are working inside
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-gps").setup()
    end,
  }

  -- use 'arkav/lualine-lsp-progress'

  -- Choose  'j-hui/fidget.nvim' instead of 'arkav/lualine-lsp-progress'

  -- Standalone UI for nvim-lsp progress
  -- After the plugin is loaded (e.g., after plug#end() for vim-plug),
  -- call its setup function (in Lua):  require('fidget').setup{}
  -- use {
  --   'j-hui/fidget.nvim',
  --   config = function()
  --     require('fidget').setup{}
  --   end
  -- }

  ----------------------------
```

```lua
-- require('config/lualine')
require('config/lualine_gps')

-- require('config/lualine_eviline')
-- require('config/lualine_gps_eviline')
```

------------------------------
#### No_ 07:  aaa
```lua

```

------------------------------

