vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move line up
vim.keymap.set("n", "n", "nzzzv")            -- Keep cursor centered when searching
vim.keymap.set("n", "N", "Nzzzv")            -- Keep cursor centered when searching

vim.keymap.set("n", "<leader>y", '"+y')      -- Copy to system clipboard in normal mode
vim.keymap.set("n", "<leader>Y", '"+Y')      -- Copy to system clipboard in normal mode (whole line)
vim.keymap.set("v", "<leader>y", '"+y')      -- Copy to system clipboard in visual mode

vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- Move down half a page and center cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- Move up half a page and center cursor

-- LSP related keymaps
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end)
