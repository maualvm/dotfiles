return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    { "<leader>fz", ":FzfLua<CR>",            silent = true, desc = "Open FzfLua" },
    { "<leader>ff", ":FzfLua files<CR>",      silent = true, desc = "Open file picker" },
    { "<leader>fg", ":FzfLua live_grep<CR>",  silent = true, desc = "Fuzzy/Regex search" },
    { "<leader>fr", ":FzfLua oldfiles<CR>",   silent = true, desc = "Open recent files" },
  },
}
