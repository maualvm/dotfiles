vim.pack.add({
  "https://github.com/navarasu/onedark.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/lewis6991/gitsigns.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/mikavilpas/yazi.nvim",            version = vim.version.range("*") },
})

require("onedark").setup({
  transparent = false,
  style = "darker",
})

require("gitsigns").setup({
  current_line_blame = true,
})

require("yazi").setup({
  open_for_directories = true,
  keymaps = { show_help = "<leader>?", },
})

local languages = { "lua", "php", "ruby", "go" } -- Add more as needed
require("nvim-treesitter").install(languages)
vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function() vim.treesitter.start() end,
})
