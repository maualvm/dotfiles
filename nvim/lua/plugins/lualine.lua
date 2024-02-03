local opts = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = "|",
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha" },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = { "branch", "diff" },
    lualine_c = {
      {
        "filename",
        path = 1
      },
      {
        "diagnostics",
        sources = { "nvim_lsp" },
      }
    },
    lualine_x = { "encoding", "filetype" },
    lualine_y = { "progress" },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
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
