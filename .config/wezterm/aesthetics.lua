local wezterm = require "wezterm"

local aesthetics = {}

-- not actually using this right now since default looks better
aesthetics.color_scheme = "tokyonight"
aesthetics.window_background_opacity = 0.75
aesthetics.hide_tab_bar_if_only_one_tab = true

if wezterm.hostname() == "jrodal-mbp" then
   aesthetics.font_size = 20
else
   aesthetics.font_size = 16
end

-- Configures whether the window has a title bar and/or resizable border.
aesthetics.window_decorations = "RESIZE"

return aesthetics
