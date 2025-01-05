return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      alpha = true,
      cmp = true,
      gitsigns = true,
      harpoon = true,
      indent_blankline = {
        enabled = true,
        scope_color = "",
        colored_indent_levels = true,
      },
      mason = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      telescope = {
        enabled = true,
      },
      treesitter = true,
    }
  }
}
