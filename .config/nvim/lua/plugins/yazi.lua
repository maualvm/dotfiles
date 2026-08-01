return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  dependecies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    { "<leader>fb", mode = { "n", "v"}, "<cmd>Yazi<CR>",  desc = "Open yazi at the current file" },
    { "<leader>cw", mode = { "n", "v" }, "<cmd>Yazi cwd<cr>", desc = "Open yazi in nvim's current working directory" },
    { "<c-up>", mode = { "n", "v" }, "<cmd>Yazi toggle<cr>", desc = "Resume the last yazi session" },
  },
  opts = {
    open_for_directories = true,
    keymaps = {
      show_help = "<leader>?", -- show help menu
    },
  },
}
