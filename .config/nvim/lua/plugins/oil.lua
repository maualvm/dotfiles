return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true,
    }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  lazy = false,
  keys = {
    { "<leader>o", "<cmd>lua require('oil').open()<CR>",        silent = true, desc = "Open file browser" },
    { "<leader>O", "<cmd>lua require('oil').open_float()<CR>",  silent = true, desc = "Open file browser in a floating window" }
  }
}
