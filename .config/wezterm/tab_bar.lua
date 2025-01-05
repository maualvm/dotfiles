local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
  config.tab_bar_at_bottom = true
  config.use_fancy_tab_bar = false
  config.show_new_tab_button_in_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = true
  config.colors = {
    tab_bar = {
      background = "rgba(0,0,0,0)"
    },
  }
end

return module
