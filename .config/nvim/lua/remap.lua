vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                          -- Move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")                          -- Move line up
vim.keymap.set("n", "n", "nzzzv")                                     -- Keep cursor centered when searching
vim.keymap.set("n", "N", "Nzzzv")                                     -- Keep cursor centered when searching

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')                      -- Copy to system clipboard in normal and visual mode
vim.keymap.set("n", "<leader>Y", '"+Y')                               -- Copy to system clipboard in normal mode (whole line)

vim.keymap.set("n", "<C-d>", "<C-d>zz")                               -- Center cursor when moving down half a page
vim.keymap.set("n", "<C-u>", "<C-u>zz")                               -- Center cursor when moving up half a page

vim.keymap.set('n', '<leader>ln', ':set rnu!<CR>', { silent = true }) -- Toggle relative line numbers on/off

-- LSP
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end)

-- Fugitive
vim.keymap.set("n", "<leader>gs", ":G<CR>", { silent = true, desc = "Git status" })
vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { silent = true, desc = "Git write (stage current file)" })
vim.keymap.set("n", "<leader>gc", ":G commit<CR>", { silent = true, desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", ":G push<CR>", { silent = true, desc = "Git push" })
vim.keymap.set("n", "<leader>gl", ":G pull<CR>", { silent = true, desc = "Git pull" })
vim.keymap.set("n", "<leader>g-", ":G reset HEAD %<CR>", { silent = true, desc = "Git reset HEAD (unstage file)" })
vim.keymap.set("n", "<leader>gd", ":G checkout -- %<CR>", { silent = true, desc = "Git checkout file (discard changes)" })

-- Gitsigns
vim.keymap.set("n", "[g", function() require("gitsigns").prev_hunk() end, { silent = true, desc = "Go to previous hunk" })
vim.keymap.set("n", "]g", function() require("gitsigns").next_hunk() end, { silent = true, desc = "Go to next hunk" })
vim.keymap.set("n", "<leader>hp", function()
  require("gitsigns").preview_hunk()
end, {
  silent = true,
  desc = "Preview hunk",
})
vim.keymap.set("n", "<leader>hi", function()
  require("gitsigns").preview_hunk_inline()
end, {
  silent = true,
  desc = "Preview hunk inline",
})

-- FzfLua
vim.keymap.set("n", "<leader>fz", ":FzfLua<CR>", { silent = true, desc = "Open FzfLua" })
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", { silent = true, desc = "Open file picker" })
vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>", { silent = true, desc = "Fuzzy/Regex search" })
vim.keymap.set("n", "<leader>fr", ":FzfLua oldfiles<CR>", { silent = true, desc = "Open recent files" })

-- Yazi
vim.keymap.set({ "n", "v" }, "<leader>fb", "<cmd>Yazi<CR>", { desc = "Open yazi at the current file" })
vim.keymap.set({ "n", "v" }, "<leader>cw", "<cmd>Yazi cwd<CR>", { desc = "Open yazi in nvim's current working directory" })
vim.keymap.set({ "n", "v" }, "<C-Up>", "<cmd>Yazi toggle<CR>", { desc = "Resume the last yazi session" })
