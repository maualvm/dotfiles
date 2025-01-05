return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
																						 
			████ ██████           █████      ██
		 ███████████             █████ 
		 █████████ ███████████████████ ███   ███████████
		█████████  ███    █████████████ █████ ██████████████
	 █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████
]]
      dashboard.section.header.val = vim.split(logo, "\n")
      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("b", "󰉓  Browse Files", ":Telescope file_browser<CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>"),
        dashboard.button("t", "󰊄  Find text", ":Telescope live_grep_args<CR>"),
        dashboard.button("s", "  Settings", "<cmd>Telescope file_browser path=$HOME/.config/nvim<CR>"),
        dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
      }
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.opts.layout[1].val = 6
      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)
      vim.api.nvim_create_autocmd("User", {
        callback = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 1000) / 1000
          dashboard.section.footer.val =
              "Loaded "
              .. stats.loaded
              .. " plugins in "
              .. ms
              .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end
      })
    end
  }
}
