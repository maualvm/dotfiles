return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  lazy = false,
  keys = {
    { "<leader>fz", ":FzfLua<CR>",              silent = true, desc = "Open FzfLua" },
    { "<leader>ff", ":FzfLua files<CR>",        silent = true, desc = "Open file picker" },
    { "<leader>fg", ":FzfLua grep_visual<CR>",  silent = true, desc = "Grep for text" },
  },
}
