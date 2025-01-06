local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
  config.color_scheme = 'Catppuccin Mocha'
  config.font = wezterm.font('JetBrains Mono NL')
  config.font_size = 14.00

  config.initial_cols = 160
  config.initial_rows = 45

  config.window_decorations = "RESIZE"
  config.window_padding = {
    left = '0cell',
    right = '0cell',
    top = '0.5cell',
    bottom = '0.5cell',
  }
end

return module
