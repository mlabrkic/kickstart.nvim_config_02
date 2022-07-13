-- https://github.com/nvim-lualine/lualine.nvim

-- Set lualine as statusline
-- :help lualine.txt

------------------------------------------------------------
-- Usage and customization:
-- https://github.com/nvim-lualine/lualine.nvim#usage-and-customization

-- Lualine has sections as shown below.
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+
-- Each sections holds its components e.g. Vim's current mode.

------------------------------------------------------------
-- Default configuration:
-- https://github.com/nvim-lualine/lualine.nvim#default-configuration

--[[
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
--]]

------------------------------------------------------------
-- If you want to get your current lualine config, you can do so with:
-- require('lualine').get_config()

-- https://github.com/nanotee/nvim-lua-guide#the-vim-namespace
-- vim.inspect: transform Lua objects into human-readable strings (useful for inspecting tables)
-- vim.inspect(require('lualine').get_config())

-- :lua print(vim.inspect(require('lualine').get_config()))

------------------------------------------------------------
-- Setting a theme:
-- https://github.com/nvim-lualine/lualine.nvim#setting-a-theme

-- Separators:
-- https://github.com/nvim-lualine/lualine.nvim#separators

-- Changing components in lualine sections:
-- https://github.com/nvim-lualine/lualine.nvim#changing-components-in-lualine-sections

-- Component options:
-- https://github.com/nvim-lualine/lualine.nvim#component-options

-- Extensions:
-- https://github.com/nvim-lualine/lualine.nvim#extensions

------------------------------------------------------------
-- Wiki:
-- https://github.com/nvim-lualine/lualine.nvim/wiki

------------------------------
-- You can find some useful configuration snippets here.
-- https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets

-- Using external source for diff:
-- https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#using-external-source-for-diff

------------------------------------------------------------
-- https://github.com/nvim-lualine/lualine.nvim#starting-lualine

require('lualine').setup {
  options = {
    icons_enabled = false,
    -- theme = 'onedark',
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
  },
}

