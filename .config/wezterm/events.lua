local wezterm = require "wezterm"
local aesthetics = require "aesthetics"

wezterm.on("toggle-opacity", function(window, _)
   local overrides = window:get_config_overrides() or {}
   if overrides.window_background_opacity == 1 then
      overrides.window_background_opacity = aesthetics.window_background_opacity
   else
      overrides.window_background_opacity = 1
   end
   window:set_config_overrides(overrides)
end)
