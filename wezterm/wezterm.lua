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
config.font_size = 14.00
config.initial_cols = 160
config.initial_rows = 45

config.window_decorations = 'RESIZE'
config.window_padding = {
  left = '0px',
  right = '0px',
  top = '20px',
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
  }, -- Make Cmd-Left equivalent to go to beginning of line
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action { SendString = "\x1bOF" },
  }, -- Make Cmd-Right equivalent to go to end of line
  {
    key = 'Backspace',
    mods = 'CMD',
    action = wezterm.action.SendKey({ mods = 'CTRL', key = 'u' }),
  }, -- Make Cmd-Backspace equivalent to delete to beginning of line
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
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.MoveTabRelative(1),
  },
}

-- Tab bar configuration
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Tab title configuration
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, window_config, hover, max_width)
    local title = ' ' .. wezterm.truncate_right(tab.tab_index + 1, max_width - 2) .. ' '
    local edge_background = '#11111b' -- Crust
    local background = '#313244'      -- Surface1
    local foreground = '#cdd6f4'      -- Text
    local edge_prefix = ''
    local edge_suffix = ''

    if tab.is_active then
      background = '#89b4fa' -- Blue
      foreground = '#11111b' -- Crust
    end

    local edge_foreground = background -- either Blue or Surface1

    if tab.tab_index == 0 then
      edge_prefix = wezterm.nerdfonts.ple_left_half_circle_thick
      title = string.sub(title, 2) -- remove leading space
    end

    if tab.tab_index == tabs[#tabs].tab_index then
      edge_suffix = wezterm.nerdfonts.ple_right_half_circle_thick
      title = string.sub(title, 1, -2) -- remove trailing space
    end

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = edge_prefix },
      { Attribute = { Italic = false } },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Attribute = { Intensity = 'Bold' } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = edge_suffix },
    }
  end
)

return config
