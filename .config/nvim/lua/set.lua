vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.winborder = "rounded"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "124"

vim.opt.list = true
vim.opt.listchars = {
  trail = "·",
  tab = "  ",
	eol = "¬",
}

-- Tabs
vim.opt.tabstop = 2      -- Width of a tab (`\t`) character
vim.opt.softtabstop = 2  -- <Tab> behaves in 2-column increments
vim.opt.shiftwidth = 2   -- `>>`, `<<`, `=` and indentation use 2 columns
vim.opt.expandtab = true -- Use spaces instead of tabs (`\t`)

-- Autocomplete
vim.opt.autocomplete = true
vim.opt.complete = { ".", "t", "o" }
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
vim.opt.pumborder = "rounded"
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end
})

-- Cmdline autocomplete
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

-- Statusline
vim.api.nvim_create_autocmd("LspProgress", {
  callback = function() vim.cmd("redrawstatus") end,
})
vim.o.laststatus = 3
vim.o.statusline = table.concat({ "%F", "%h%m%w%r", "%{v:lua.vim.lsp.status()}" }, " ")
