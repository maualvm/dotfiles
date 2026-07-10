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
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<leader>?", -- show help menu
    },
  },
  -- if you use `open_for_directories = true` you can use this to open yazi instead of netrw
  init = function()
    -- mark netrw as loaded so it's not loaded at all.
    --
    -- More details : https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g.loaded_netrwPlugin = 1
  end,
}
