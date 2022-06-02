-- https://jdhao.github.io/2019/11/03/vim_custom_statusline/

-- https://zignar.net/2022/01/21/a-boring-statusline-for-neovim/
-- (https://github.com/mfussenegger)

------------------------------------------------------------
-- :h statusline

-- :h status-line
-- 'laststatus' = 0	never a status line
-- 'laststatus' = 1	status line if there is more than one window
-- 'laststatus' = 2	always a status line
-- 'laststatus' = 3	have a global statusline at the bottom instead of one for each window

-- Statusline item format:
-- Usually, the statusline consists of multiple printf style % items
-- for showing various info about current file,
-- e.g., %F is used to show the full path of current file.
--
-- The complete format for items are as follows:
-- %-0{minWidth}.{maxWidth}{item}

------------------------------------------------------------
-- https://github.com/SmiteshP/nvim-gps
-- Lua
-- local gps = require("nvim-gps")

-- require("lualine").setup({
-- 	sections = {
-- 			lualine_c = {
-- 				{ gps.get_location, cond = gps.is_available },
-- 			}
-- 	}
-- })

------------------------------------------------------------
-- https://github.com/nvim-lualine/lualine.nvim

-- Set statusbar
require('lualine').setup {
  options = {
    -- icons_enabled = false,  -- mlabrkic
    -- theme = 'onedark',
    theme = "auto",
    component_separators = '|',
    section_separators = '',
  },
	sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			"filename",
			-- { gps.get_location, cond = gps.is_available, color = { fg = "#f3ca28" }, },
		},
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
	},
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    -- lualine_c = { "filename" },
    lualine_c = {},
    -- lualine_x = { "location" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  -- extensions = {'quickfix', 'fugitive', 'nvim-tree'},
}

