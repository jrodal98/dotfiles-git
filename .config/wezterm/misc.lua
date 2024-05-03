local wezterm = require "wezterm"

local misc = {}

-- prevents terminal hanging when exiting with ctrl-d
misc.exit_behavior = "Close"
misc.audible_bell = "Disabled"

local hostname = wezterm.hostname()

local default_progs = {
   ["jrodal-850"] = { "pwsh", "-l" },
   ["jrodal-257"] = { "C:/Users/jrodal/.config/wezterm/bin/windows_default_shell.cmd" },
}

if default_progs[hostname] then
   misc.default_prog = default_progs[hostname]
else
   misc.default_prog = nil
end

local default_domains = {
   ["PW08WPZH"] = "WSL:Ubuntu",
}

if default_domains[hostname] then
   misc.default_domain = default_domains[hostname]
else
   misc.default_domain = nil
end

return misc
