local wezterm = require 'wezterm'
local theme = require 'theme'
local tab_bar = require 'tab_bar'
local tab_title = require 'tab_title'
local keybinds = require 'keybinds'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

theme.apply_to_config(config)
tab_bar.apply_to_config(config)
keybinds.apply_to_config(config)
wezterm.on('format-tab-title', tab_title.format_tab_title)

return config
