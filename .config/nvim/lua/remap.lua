vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")     -- Move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")     -- Move line up
vim.keymap.set("n", "n", "nzzzv")                -- Keep cursor centered when searching
vim.keymap.set("n", "N", "Nzzzv")                -- Keep cursor centered when searching

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y') -- Copy to system clipboard in normal and visual mode
vim.keymap.set("n", "<leader>Y", '"+Y')          -- Copy to system clipboard in normal mode (whole line)

vim.keymap.set("n", "<C-d>", "<C-d>zz")          -- Center cursor when moving down half a page
vim.keymap.set("n", "<C-u>", "<C-u>zz")          -- Center cursor when moving up half a page

-- LSP related keymaps
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end)
