local wezterm = require "wezterm"

local misc = {}

-- prevents terminal hanging when exiting with ctrl-d
misc.exit_behavior = "Close"
misc.audible_bell = "Disabled"

if wezterm.hostname() == "jrodal-850" then
   misc.default_prog = { "pwsh", "-l" }
elseif wezterm.hostname() == "jrodal-257"  then
  misc.default_prog = { "C:/msys64/msys2_shell.cmd", "-defterm", "-no-start", "-ucrt64", "-use-full-path" }
else
   misc.default_prog = nil
end
return misc
