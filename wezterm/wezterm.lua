-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('JetBrains Mono NL')
config.font_size = 14.
config.font = wezterm.font('JetBrains Mono NL')
config.font_size = 14.00
config.initial_cols = 140
config.initial_rows = 40

config.window_padding = {
  left = '0px',
  right = '0px',
  top = '0px',
  bottom = '0px',
}

config.keys = {
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action { SendString = "\x1bb" }
  }, -- Make Option-Left equivalent to Alt-b; backward-word
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action { SendString = "\x1bf" }
  }, -- Make Option-Right equivalent to Alt-f; forward-word

  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action { SendString = "\x1bOH" },
  }, -- Make Cmd-Left equivalent to delete to beginning of line
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action { SendString = "\x1bOF" },
  }, -- Make Cmd-Right equivalent to delete to end of line
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.Multiple {
      wezterm.action.ClearScrollback 'ScrollbackAndViewport',
      wezterm.action.SendKey { key = 'L', mods = 'CTRL' },
    },
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'r',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.RotatePanes 'Clockwise',
  },
}

-- Tab bar configuration
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, window_config, hover, max_width)
    local edge_background = '#11111b' -- darkest background
    local background = '#1e1e2e'      -- dark background
    local foreground = '#cdd6f4'      -- light text

    if tab.is_active then
      background = '#cba6f7' -- purple
      foreground = '#11111b' -- dark background (text)
    end

    local edge_foreground = background
    local title = tab.active_pane.title

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Attribute = { Italic = true } },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Attribute = { Intensity = 'Bold' } },
      { Text = '  ' .. title .. '  ' },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
    }
  end
)

return config
