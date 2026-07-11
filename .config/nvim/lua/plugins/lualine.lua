local opts = {
  options = {
    theme = "auto",
    icons_enabled = true,
    component_separators = "│",
    section_separators = "",
    always_divide_middle = true,
    globalstatus = true,
  },
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = {
      { "filename",    path = 3 },
      { "diagnostics", sources = { "nvim_lsp" } }
    },
    lualine_x = { "lsp_status" },
    lualine_y = { "encoding", "filetype" },
    lualine_z = { "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = opts,
}
