vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left buffer" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to up buffer" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to down buffer" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right buffer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Keep cursor centered when searching (next)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor centered when searching (previous)" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor when moving down half a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor when moving up half a page" })

vim.keymap.set('n', '<leader>ln', ':set rnu!<CR>', { silent = true, desc = "Toggle relative line numbers on/off" })

-- LSP
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format file" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic in floating window" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>")

-- Fugitive
vim.keymap.set("n", "<leader>gs", ":G<CR>", { silent = true, desc = "Git status" })
vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { silent = true, desc = "Git write (stage current file)" })
vim.keymap.set("n", "<leader>gc", ":G commit<CR>", { silent = true, desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", ":G push<CR>", { silent = true, desc = "Git push" })
vim.keymap.set("n", "<leader>gl", ":G pull<CR>", { silent = true, desc = "Git pull" })
vim.keymap.set("n", "<leader>g-", ":G reset HEAD %<CR>", { silent = true, desc = "Git reset HEAD (unstage file)" })
vim.keymap.set("n", "<leader>gd", ":G checkout -- %<CR>", { silent = true, desc = "Git checkout file (discard changes)" })

-- Gitsigns
vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>", { silent = true, desc = "Go to previous hunk" })
vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR>", { silent = true, desc = "Go to next hunk" })
vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { silent = true, desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hi", ":Gitsigns preview_hunk_inline<CR>", { silent = true, desc = "Preview hunk inline" })
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { silent = false, desc = "Reset hunk" })

-- FzfLua
vim.keymap.set("n", "<leader>fz", ":FzfLua<CR>", { silent = true, desc = "Open FzfLua" })
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", { silent = true, desc = "Open file picker" })
vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>", { silent = true, desc = "Fuzzy/Regex search" })
vim.keymap.set("n", "<leader>fr", ":FzfLua oldfiles<CR>", { silent = true, desc = "Open recent files" })

-- Yazi
vim.keymap.set({ "n", "v" }, "<leader>fb", ":Yazi<CR>", { desc = "Open yazi at the current file" })
vim.keymap.set({ "n", "v" }, "<leader>cw", ":Yazi cwd<CR>", { desc = "Open yazi in nvim's current working directory" })
vim.keymap.set({ "n", "v" }, "<C-Up>", ":Yazi toggle<CR>", { desc = "Resume the last yazi session" })
