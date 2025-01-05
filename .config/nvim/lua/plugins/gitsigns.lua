return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  opts = {
    current_line_blame = true
  },
  keys = {
    { "[g", "<cmd>lua require('gitsigns').prev_hunk()<CR>" },
    { "]g", "<cmd>lua require('gitsigns').next_hunk()<CR>" },
  }
}
