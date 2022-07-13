--[[

2022-07M-13
------------------------------------------------------------
https://github.com/nanotee/nvim-lua-guide

------------------------------------------------------------
1) Neovim:  nvim-win64.zip
https://github.com/neovim/neovim/releases/latest
NVIM v0.7.2, Latest stable release
2022-07M-04
github-actions released this 8 days ago v0.7.2  e8ee673

------------------------------------------------------------
2) Neovim starter config:  kickstart.nvim
https://github.com/nvim-lua/kickstart.nvim
mjlbach
2022-07M-04
tjdevries "init: kickstart.nvim" 10 days ago

------------------------------------------------------------
3) mlabrkic - My Neovim config (based on kickstart.nvim):
Neovim Lua configuration
I edited init.lua from "kickstart.nvim" (No_ 01 - No_ 06)

------------------------------
https://github.com/mlabrkic/kickstart.nvim_config_01
2022-07M-11
No_ 01:  Plugins: 'sainnhe/gruvbox-material', 'hrsh7th/nvim-cmp'
No_ 02:  OPTIONS
No_ 03:  telescope-fzf-native --> Windows with MinGW
No_ 04:  nvim-treesitter --> Windows with MinGW
No_ 05:  sumneko/lua-language-server

------------------------------
https://github.com/mlabrkic/kickstart.nvim_config_02
No_ 06:  'nvim-lualine/lualine.nvim'
2022-07M-13

]]
------------------------------------------------------------
-- https://github.com/wbthomason/packer.nvim#bootstrapping
-- Install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

------------------------- PLUGINS --------------------------
-- Installation

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                                 -- Package manager
  use 'tpope/vim-fugitive'                                                     -- Git commands in nvim
  use 'tpope/vim-rhubarb'                                                      -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }    -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                                  -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter'                                        -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'                            --  Additional textobjects for treesitter

------------------------------
  -- Autocompletion

  -- mlabrkic:
  -- use 'neovim/nvim-lspconfig'                                                  -- Collection of configurations for built-in LSP client
  -- use 'williamboman/nvim-lsp-installer'                                        -- Automatically install language servers to stdpath

  -- use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }            -- Autocompletion
  -- use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }        -- Snippet Engine and Snippet Expansion

--[[
https://github.com/neovim/nvim-lspconfig
https://github.com/hrsh7th/nvim-cmp

https://github.com/hrsh7th/cmp-nvim-lsp
https://github.com/hrsh7th/cmp-buffer
https://github.com/hrsh7th/cmp-path
https://github.com/hrsh7th/cmp-cmdline

https://github.com/L3MON4D3/LuaSnip
https://github.com/saadparwaiz1/cmp_luasnip
]]

  -- https://github.com/hrsh7th/nvim-cmp#recommended-configuration
  use 'neovim/nvim-lspconfig'                              -- Collection of configurations for built-in LSP client
  -- use 'williamboman/nvim-lsp-installer'                    -- Automatically install language servers to stdpath

  -- Autocompletion
  -- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
  use {
    'hrsh7th/nvim-cmp',                                    -- A completion engine plugin for neovim written in Lua.
    requires = {
      'hrsh7th/cmp-nvim-lsp',                              -- nvim-cmp source for neovim builtin LSP client
      'hrsh7th/cmp-buffer',                                -- nvim-cmp source for buffer words
      -- 'hrsh7th/cmp-path',                                  -- nvim-cmp source for filesystem paths
      -- 'hrsh7th/cmp-cmdline'                                -- nvim-cmp source for vim's cmdline (command mode and for / search)
    }
  }

  -- For luasnip users.
  use {
    'L3MON4D3/LuaSnip',                -- Snippet Engine (Expand LSP-Snippets with nvim-cmp (requires cmp_luasnip))
    requires = {
      'saadparwaiz1/cmp_luasnip'       -- luasnip completion source for nvim-cmp
    }
  }

------------------------------
  -- use 'mjlbach/onedark.nvim'                                                -- Theme inspired by Atom
  use 'sainnhe/gruvbox-material'  -- mlabrkic

------------------------------------------------------------
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

------------------------------------------------------------
  use 'lukas-reineke/indent-blankline.nvim'                                    -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                                                       -- Detect tabstop and shiftwidth automatically

  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Fuzzy Finder (files, lsp, etc)

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }
  use { 'nvim-telescope/telescope-fzf-native.nvim' }

------------------------------------------------------------
  -- mlabrkic:

------------------------------
  -- mlabrkic:
  --[[
  Automatically set up your configuration after cloning packer.nvim
  Put this at the end after all plugins

  https://github.com/wbthomason/packer.nvim#quickstart
  PackerSync perform:
    PackerUpdate (Clean, then update and install plugins) and then
    PackerCompile (Regenerate compiled loader file)
  ]]
  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

------------------------------------------------------------
-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

--[[
:h <afile>
:lua print(vim.fn.expand('$MYVIMRC'))
]]

------------------------- OPTIONS --------------------------
-- Setting options
--[[
Managing vim options:
https://github.com/nanotee/nvim-lua-guide#using-meta-accessors
:help vim.o
:h vim.opt

:lua print(vim.o.number)
]]

------------------------------
-- Some options can be set using Lua tables:

-- vim.cmd [[set wildignore=*.pyc,*.o]]
--[[
:lua vim.opt.wildignore = {'*.pyc', '*.o'}
:lua print(vim.inspect(vim.opt.wildignore:get()))

vim.opt.completeopt = {'menuone', 'noselect'}
:lua print(vim.inspect(vim.opt.completeopt:get()))
]]
------------------------------

vim.wo.relativenumber = true  -- mlabrkic
vim.wo.cursorline = true  -- mlabrkic

-- Set highlight on search
-- vim.o.hlsearch = false  -- mlabrkic

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- mlabrkic:
-- pcall(vim.cmd, 'colorscheme gruvbox-material')
vim.cmd [[
  " colorscheme onedark
  colorscheme gruvbox-material
]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

------------------------ MAPPINGS --------------------------
--[[
OLD:
https://github.com/nanotee/nvim-lua-guide#api-functions
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

NEW:
https://github.com/nanotee/nvim-lua-guide#vimkeymap
vim.keymap.set() - only available in Neovim 0.7.0+
:help vim.keymap.set()
]]
------------------------------
-- [[ Basic Keymaps ]]

-- Set <space> as the leader key
--[[
:help mapleader
NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

------------------------------
-- https://neovim.io/doc/user/vim_diff.html#nvim-defaults
-- :h default-mappings
--[[
nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
--]]

------------------------------
-- mlabrkic:
vim.keymap.set('n', '<F4>', '<cmd>set relativenumber!<cr>', { silent = true })
vim.keymap.set('n', '<leader>w', '<cmd>update<cr>', { silent = true }) -- Saves the file if modified


------------------------------
-- mlabrkic
-- clipboard:

-- vim.cmd [[set clipboard+=unnamedplus]]  -- mlabrkic

--[[
https://dev.to/vonheikemen/build-your-first-neovim-configuration-in-lua-177b

The default behavior in Neovim (and Vim) doesn't take into account the system clipboard.
It has its own mechanism to store text.
When we copy something using the y keybinding that text goes to an internal register.
I prefer to keep it that way, and what I do is create dedicated bindings to interact with the clipboard.
]]

-- Copy to clipboard.
-- vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, '<C-c>', '"+y')

-- Paste from clipboard.
-- vim.keymap.set({'n', 'x'}, 'cv', '"+p')
vim.keymap.set({'n', 'x'}, '<C-p>', '"+p')

--[[
Delete without changing the registers
When we delete text in normal mode or visual mode using c, d or x that text goes to a register.
This affects the text we paste with the keybinding p.
]]
vim.keymap.set({'n', 'x'}, 'x', '"_x')


---------------------- AUTOCOMMANDS ------------------------
--[[
:h autocmd

:h autocmd-list
autocmd TextYankPost

:h autocmd-remove
:au[tocmd]! [group]	- Remove ALL autocommands.
autocmd!  - When the [group] argument is not given, Vim uses the current group

:h events

:h <afile>
When executing autocommands, is replaced with the file name of the buffer being manipulated
]]
------------------------------
-- OLD:
-- https://github.com/ojroques/dotfiles/blob/master/nvim/.config/nvim/init.lua

-- Highlight on yank
-- vim.cmd [[
--   augroup YankHighlight
--     autocmd!
--     autocmd TextYankPost * silent! lua vim.highlight.on_yank()
--   augroup end
-- ]]

------------------------------
--[[
NEW:
https://github.com/nanotee/nvim-lua-guide#defining-autocommands
Neovim 0.7.0 has API functions for autocommands.
:help api-autocmd
]]

-- [[ Highlight on yank ]]
-- :help vim.highlight.on_yank()
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

--------------------- PLUGINS SETUP ------------------------

------------------------------------------------------------
-- :h statusline

------------------------------
-- 1) statusline:  vimscript

--[[
:h variable-scope

There are several name spaces for variables.
|global-variable|    g:	  Global.
|script-variable|    s:	  Local to a |:source|'ed Vim script.
|vim-variable|       v:	  Global, predefined by Vim.
]]

-- vim.cmd [[
--   augroup AU_statusline
--     autocmd!
--     " let g:path_to_source = stdpath("config") . "\\" . "SL\\statusline_ternary.vim"
--     let g:path_to_source = stdpath("config") . "\\" . "SL\\statusline.vim"
--     autocmd VimEnter * execute "source" g:path_to_source
--   augroup end
-- ]]

------------------------------
-- 2) statusline:  lualine

-- require('SL/lualine')
require('SL/lualine_nvim-navic')

------------------------ Lualine ---------------------------
--[[
SL - statusline
echo stdpath("config") . "\\" . "lua\\SL\\lualine.lua"
lua print(vim.fn.stdpath("config") .. "\\" .. "lua\\SL\\lualine.lua")

------------------------------
Set lualine as statusline
:help lualine.txt
]]

-- require('lualine').setup {
--   options = {
--     icons_enabled = false,
--     -- theme = 'onedark',
--     theme = 'auto',
--     component_separators = '|',
--     section_separators = '',
--   },
-- }

------------------------ Comment ---------------------------
--[[
Enable Comment.nvim
require('Comment').setup()
]]

require('Comment').setup{} -- mlabrkic

-------------------- Indent blankline ----------------------
--[[
Enable `lukas-reineke/indent-blankline.nvim`
:help indent_blankline.txt
]]

require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

------------------------ Gitsigns --------------------------
--[[
Gitsigns
:help gitsigns.txt
]]

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

----------------------- TELESCOPE --------------------------
--[[
Configure Telescope
:help telesceope
:help telescope.setup()
]]

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- :help telescope.builtin
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

---------------------- TREE-SITTER -------------------------
--[[
Configure Treesitter
:help nvim-treesitter
]]

require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  -- ensure_installed = { 'lua', 'typescript', 'rust', 'go', 'python' },
  ensure_installed = { 'lua', 'vim', 'python', 'java' }, -- mlabrkic

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      -- TODO: I'm not sure for this one.
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

------------------------------------------------------------
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-------------------------- LSP -----------------------------
-- LSP settings.
--[[
mlabrkic:
https://github.com/neovim/nvim-lspconfig
local servers = { 'pyright', 'vimls', 'sumneko_lua' }

Python:  npm i -g pyright
vimls:   npm install -g vim-language-server
Lua:     https://github.com/sumneko/lua-language-server
Java:    https://github.com/mfussenegger/nvim-jdtls
]]
------------------------------
local navic = require("nvim-navic")  -- mlabrkic

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  navic.attach(_, bufnr)  -- mlabrkic
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]tion')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting, { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable the following language servers
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'sumneko_lua' }
local servers = { 'pyright', 'vimls', 'sumneko_lua' } -- mlabrkic

-- mlabrkic:
-- Ensure the servers above are installed
-- require('nvim-lsp-installer').setup {
--   ensure_installed = servers,
-- }

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  cmd = {'C:/UTILS/PORT/Neovim_LSP/sumneko_lua/bin/lua-language-server'}, -- mlabrkic
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
    },
  },
}

----------------- 'hrsh7th/nvim-cmp' setup -----------------
-- https://dev.to/vonheikemen/neovim-lsp-setup-nvim-lspconfig-nvim-cmp-4k8e

-- nvim-cmp setup
local cmp = require 'cmp'

-- luasnip setup
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- https://github.com/hrsh7th/nvim-cmp#recommended-configuration
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- { name = 'luasnip', option = { keyword_length = 2, } },  -- mlabrkic
    { name = 'buffer' },  -- mlabrkic
		-- { name = "buffer", option = { keyword_length = 3, keyword_pattern = [[\k\+]], }},  -- mlabrkic
    -- { name = 'path' },  -- mlabrkic
		-- { name = "nvim_lsp_signature_help" },
		-- { name = "nvim_lua" },
  },
}

--[[
-- mlabrkic:
-- https://github.com/hrsh7th/nvim-cmp#recommended-configuration
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
]]


-- The line beneath this is called `modeline`.
-- help modeline
-- vim: ts=2 sts=2 sw=2 et
