local wezterm = require "wezterm"
local select = require "select"

local bindings = {}

-- default bindings: https://wezfurlong.org/wezterm/config/default-keys.html
bindings.keys = {
   { key = "+", mods = "SUPER|SHIFT", action = "IncreaseFontSize" },
   { key = "+", mods = "CTRL|SHIFT", action = "IncreaseFontSize" },
   {
      key = "e",
      mods = "CTRL|SHIFT",
      action = wezterm.action {
         QuickSelectArgs = {
            label = "open url",
            patterns = select.quick_select_patterns,
            action = wezterm.action_callback(function(window, pane)
               local url = window:get_selection_text_for_pane(pane)
               wezterm.log_info("read url: " .. url)
               local transformed_url = select.transform_url(url)
               wezterm.log_info("opening: " .. transformed_url)
               wezterm.open_with(transformed_url)
            end),
         },
      },
   },
}

bindings.mouse = {
   --- Triple click on one character of the command output
   --  to select all of the output
   {
      event = { Down = { streak = 3, button = "Left" } },
      action = { SelectTextAtMouseCursor = "SemanticZone" },
      mods = "NONE",
   },
}

return bindings
