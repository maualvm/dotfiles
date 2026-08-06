vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("set")
require("plugins")
require("remap")

vim.lsp.enable({ "lua_ls", "gopls", "intelephense" }) -- Add more as needed
vim.cmd.colorscheme("onedark")
