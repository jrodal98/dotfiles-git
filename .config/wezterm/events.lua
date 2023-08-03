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

local act = wezterm.action

wezterm.on("augment-command-palette", function(window, pane)
   return {
      {
         brief = "Rename tab",
         icon = "md_rename_box",

         action = act.PromptInputLine {
            description = "Enter new name for tab",
            action = wezterm.action_callback(function(window, pane, line)
               if line then
                  window:active_tab():set_title(line)
               end
            end),
         },
      },
   }
end)
