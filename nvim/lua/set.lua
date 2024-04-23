vim.g.loaded_netrw = 1        -- disable netrw
vim.g.loaded_netrwPlugin = 1  -- disable netrw plugin
vim.opt.termguicolors = true  -- enable 24-bit RGB colors
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.autoindent = true     -- Enable autoindenting
vim.opt.smartindent = true    -- Enable smart indenting

-- Set tab settings
vim.opt.tabstop = 2         -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 2     -- Like tabstop but only for leading tabs
vim.opt.shiftwidth = 2      -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.expandtab = true    -- Use spaces instead of tabs

vim.opt.mouse = "a"         -- Enable mouse support
vim.opt.colorcolumn = "124" -- Show a ruler at 124 characters

vim.opt.wrap = false        -- Disable line wrapping
vim.opt.scrolloff = 8       -- Keep 8 lines above and below the cursor when scrolling
vim.opt.signcolumn = "yes"  -- Always show the signcolumn
