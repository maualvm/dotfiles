local wezterm = require 'wezterm'
local module = {}
local action = wezterm.action

function module.apply_to_config(config)
  config.keys = {
    {
      key = 'LeftArrow',
      mods = 'OPT',
      action = action { SendString = "\x1bb" }
    }, -- Make Option-Left equivalent to Alt-b; backward-word
    {
      key = 'RightArrow',
      mods = 'OPT',
      action = action { SendString = "\x1bf" }
    }, -- Make Option-Right equivalent to Alt-f; forward-word
    {
      key = 'LeftArrow',
      mods = 'CMD',
      action = action { SendString = "\x1bOH" },
    }, -- Make Cmd-Left equivalent to go to beginning of line
    {
      key = 'RightArrow',
      mods = 'CMD',
      action = action { SendString = "\x1bOF" },
    }, -- Make Cmd-Right equivalent to go to end of line
    {
      key = 'Backspace',
      mods = 'CMD',
      action = action.SendKey({ mods = 'CTRL', key = 'u' }),
    }, -- Make Cmd-Backspace equivalent to delete to beginning of line
    {
      key = 'k',
      mods = 'CMD',
      action = action.Multiple {
        action.ClearScrollback 'ScrollbackAndViewport',
        action.SendKey { key = 'L', mods = 'CTRL' },
      },
    }, -- Make Cmd-k clear the scrollback and the screen
    {
      key = 'w',
      mods = 'CTRL|SHIFT',
      action = action.CloseCurrentPane { confirm = true },
    }, -- Make Ctrl-Shift-w close the current pane
    {
      key = 'LeftArrow',
      mods = 'CTRL|SHIFT',
      action = action.MoveTabRelative(-1),
    }, -- Make Ctrl-Shift-LeftArrow move to the previous tab
    {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT',
      action = action.MoveTabRelative(1),
    }, -- Make Ctrl-Shift-RightArrow move to the next tab
    {
      key = ',',
      mods = 'CMD',
      action = wezterm.action_callback(function(_, pane)
        local tab = pane:tab()
        local panes = tab:panes_with_info()
        if #panes == 1 then
          pane:split({
            direction = "Bottom",
            size = 0.333
          })
        elseif not panes[1].is_zoomed then
          panes[1].pane:activate()
          tab:set_zoomed(true)
        elseif panes[1].is_zoomed then
          tab:set_zoomed(false)
          panes[2].pane:activate()
        end
      end),
    } -- Make Cmd + , toggle a split terminal at the bottom
  }
end

return module
