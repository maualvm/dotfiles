local wezterm = require 'wezterm'
local module = {}

local colors = {
  SURFACE_1 = '#313244',
  TEXT = '#cdd6f4',
  CRUST = '#11111b',
  BLUE = '#89b4fa',
  TRANSPARENT = 'rgba(0,0,0,0)'
}

local left_half_circle = wezterm.nerdfonts.ple_left_half_circle_thick
local right_half_circle = wezterm.nerdfonts.ple_right_half_circle_thick

local function get_tab_edges(tab, tabs)
  local edge_prefix = tab.tab_index == 0 and left_half_circle or ''
  local edge_suffix = tab.tab_index == tabs[#tabs].tab_index and right_half_circle or ''

  return edge_prefix, edge_suffix
end

function module.format_tab_title(tab, tabs, _panes, _window_config, _hover, max_width)
  local title = ' ' .. wezterm.truncate_right(tab.tab_index + 1, max_width - 2) .. ' '
  local background = tab.is_active and colors.BLUE or colors.SURFACE_1
  local foreground = tab.is_active and colors.CRUST or colors.TEXT
  local edge_prefix, edge_suffix = get_tab_edges(tab, tabs)

  if edge_prefix ~= '' then title = title:sub(2) end
  if edge_suffix ~= '' then title = title:sub(1, -2) end

  return {
    { Background = { Color = colors.TRANSPARENT } },
    { Foreground = { Color = background } },
    { Text = edge_prefix },
    { Attribute = { Italic = false } },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Attribute = { Intensity = 'Bold' } },
    { Text = title },
    { Background = { Color = colors.TRANSPARENT } },
    { Foreground = { Color = background } },
    { Text = edge_suffix },
  }
end

return module
