local wezterm = require "wezterm"

local misc = {}

-- prevents terminal hanging when exiting with ctrl-d
misc.exit_behavior = "Close"
misc.audible_bell = "Disabled"

local default_progs = {
   ["jrodal-850"] = { "pwsh", "-l" },
   ["jrodal-257"] = { "C:/Users/jrodal/.config/wezterm/bin/windows_default_shell.cmd" },
   ["PW08WPZH"] = { "C:/Users/jrodal/.config/wezterm/bin/windows_default_shell.cmd" },
}

local hostname = wezterm.hostname()
if default_progs[hostname] then
   misc.default_prog = default_progs[hostname]
else
   misc.default_prog = nil
end

return misc
