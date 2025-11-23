return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true,
    },
    columns = { "icon" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", ":Oil<CR>", silent = true, desc = "Open parent directory in current window" },
  }
}
