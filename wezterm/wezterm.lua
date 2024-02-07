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

-- Tab title configuration
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, window_config, hover, max_width)
    local title = '  ' .. wezterm.truncate_right(tab.active_pane.title, max_width - 2) .. '  '
    local edge_background = '#11111b' -- darkest background
    local background = '#1e1e2e'      -- dark background (grey)
    local foreground = '#cdd6f4'      -- light text
    local edge_prefix = ''
    local edge_suffix = ''

    if tab.is_active then
      background = '#cba6f7' -- purple background
      foreground = '#11111b' -- dark text
    end

    local edge_foreground = background -- either purple or grey

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
      { Attribute = { Italic = true } },
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

-- Status bar configuration
wezterm.on(
  'update-status',
  function(window, pane)
    local edge_prefix = wezterm.nerdfonts.ple_left_half_circle_thick
    local edge_suffix = wezterm.nerdfonts.ple_right_half_circle_thick
    local crust = '#11111b'
    local mauve = '#cba6f7'
    local base = '#1e1e2e'
    local text = '#cdd6f4'
    local date = ' ' .. wezterm.strftime '%a%e %b '
    local time = ' ' .. wezterm.strftime '%I:%M:%S %P '

    window:set_right_status(
      wezterm.format({
        { Background = { Color = crust } },
        { Foreground = { Color = base } },
        { Text = edge_prefix },
        { Background = { Color = base } },
        { Foreground = { Color = text } },
        { Attribute = { Italic = true } },
        { Attribute = { Intensity = 'Bold' } },
        { Text = date },

        { Background = { Color = mauve } },
        { Foreground = { Color = base } },
        { Text = time },

        { Background = { Color = crust } },
        { Foreground = { Color = mauve } },
        { Text = edge_suffix }
      })
    )
  end
)

return config
