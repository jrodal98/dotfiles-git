require "events"

local bindings = require "bindings"
local select = require "select"
local aesthetics = require "aesthetics"
local misc = require "misc"

local config = {
   ----------- Aesthetics ----------
   window_background_opacity = aesthetics.window_background_opacity,
   hide_tab_bar_if_only_one_tab = aesthetics.hide_tab_bar_if_only_one_tab,
   font_size = aesthetics.font_size,
   window_decorations = aesthetics.window_decorations,
   ----------- Bindings ----------
   keys = bindings.keys,
   key_tables = bindings.key_tables,
   mouse_bindings = bindings.mouse,
   ----------- Selection ----------
   quick_select_patterns = select.quick_select_patterns,
   hyperlink_rules = select.hyperlink_rules,
   ----------- Misc ----------
   -- prevents terminal hanging when exiting with ctrl-d
   exit_behavior = misc.exit_behavior,
   audible_bell = misc.audible_bell,
   default_prog = misc.default_prog,
}

return config
