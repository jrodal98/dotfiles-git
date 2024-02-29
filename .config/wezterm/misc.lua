local wezterm = require "wezterm"

local misc = {}

-- prevents terminal hanging when exiting with ctrl-d
misc.exit_behavior = "Close"
misc.audible_bell = "Disabled"

if wezterm.hostname() == "jrodal-850" then
   misc.default_prog = { "pwsh", "-l" }
elseif wezterm.hostname() == "jrodal-257" then
   misc.default_prog = { "C:/Users/jrodal/.config/wezterm/bin/windows_default_shell.cmd" }
else
   misc.default_prog = nil
end
return misc
