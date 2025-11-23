local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },
  lazy = false
}

M.config = function()
  local icons = {
    Property = " Property",
    Variable = "α Variable",
    Method = "󰆧 Method",
    Function = "󰡱 Function",
    Snippet = " Snippet",
    Keyword = " Keyword",
    Constant = " Constant",
    Field = " Field",
    File = " File",
    Enum = " Enum",
    EnumMember = " Enum Member",
    Struct = " Strcut",
    Class = " Class",
    Interface = " Interface",
    Module = " Module",
    Unit = " Unit",
    Operator = " Operator",
    TypeParameter = " Type Parameter",
    Reference = " Reference",
    Folder = " Folder",
    Color = " Color",
    Event = " Event",
    Value = " Value",
    Text = " Text"
  }

  local cmp = require("cmp")
  vim.opt.completeopt = { "menu", "menuone", "noselect" }
  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources(
      {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" }, -- For luasnip users.
      },
      {
        { name = "buffer" },
        { name = "path" },
      }
    ),
    formatting = {
      format = function(_, vim_item)
        vim_item.kind = (icons[vim_item.kind] or "")
        return vim_item
      end
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return M
