vim.g.loaded_netrw = 1        -- disable netrw
vim.g.loaded_netrwPlugin = 1  -- disable netrw plugin
vim.opt.termguicolors = true  -- enable 24-bit RGB colors
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.autoindent = true     -- Enable autoindenting
vim.opt.smartindent = true    -- Enable smart indenting
vim.opt.winborder = "rounded" -- Use rounded borders for floating windows

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

-- Autocomplete settings
vim.o.autocomplete = true
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end
})
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
vim.o.pumborder = "rounded"

-- Cmdline autocomplete settings
vim.api.nvim_create_autocmd("CmdlineChanged", {
  pattern = { ":", "/", "?" },
  callback = function() vim.fn.wildtrigger() end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = { "/", "?" },
  callback = function() vim.opt.pumheight = 8 end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = { "/", "?" },
  callback = function() vim.cmd("set pumheight&") end,
})
vim.opt.wildmode = { "noselect:lastused", "full" }
vim.opt.wildoptions = { "pum" }

vim.fn.complete_info({ "selected" })
