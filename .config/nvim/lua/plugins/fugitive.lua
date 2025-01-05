return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G" },
  keys = {
    { "<leader>gs", ":G<CR>",               silent = true, desc = "Git status" },
    { "<leader>gw", ":Gwrite<CR>",          silent = true, desc = "Git write (stage current file)" },
    { "<leader>gc", ":G commit<CR>",        silent = true, desc = "Git commit" },
    { "<leader>gp", ":G push<CR>",          silent = true, desc = "Git push" },
    { "<leader>gl", ":G pull<CR>",          silent = true, desc = "Git pull" },
    { "<leader>g-", ":G reset HEAD %<CR>",  silent = true, desc = "Git reset HEAD (unstage file)" },
    { "<leader>gd", ":G checkout -- %<CR>", silent = true, desc = "Git checkout file (discard changes)" }
  },
}
