return {
  "nvim-telescope/telescope.nvim", -- Fuzzy finder
  tag = "0.1.5",
  -- or                          , branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-live-grep-args.nvim" }, -- Integrate ripgrep with telescope for live grep
    { "nvim-telescope/telescope-file-browser.nvim" },   -- File browser
  },
  config = function()
    require("telescope").setup {
      defaults = {
        initial_mode = "normal",
        --sorting_strategy = "ascending"
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
        }
      },
    }
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("live_grep_args")
  end,
  cmd = "Telescope",
  keys = {
    {
      "<leader>ff",
      ":Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>",
      silent = true,
      desc = "Open find_files"
    },
    {
      "<leader>fb",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      silent = true,
      desc = "Open file_browser"
    },
    {
      "<leader>fg",
      ":Telescope live_grep_args<CR>",
      silent = true,
      desc = "Open live_grep_args"
    },
    {
      "<leader>fB",
      ":Telescope buffers<CR>",
      silent = true,
      desc = "Open buffers"
    },
    {
      "<leader>fr",
      ":Telescope oldfiles<CR>",
      silent = true,
      desc = "Open oldfiles"
    },
    {
      "<leader>fh",
      ":Telescope help_tags<CR>",
      silent = true,
      desc = "Open help_tags"
    },
  },
}
