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
    { "<leader>o", "<CMD>Oil<CR>", silent = true, desc = "Open file browser" },
  }
}
