local bindings = require "bindings"
local select = require "select"

return {
   ----------- Aesthetics ----------
   -- color_scheme = "tokyonight",
   window_background_opacity = 0.75,
   hide_tab_bar_if_only_one_tab = true,
   ----------- Bindings ----------
   keys = bindings.keys,
   mouse_bindings = bindings.mouse,
   ----------- Selection ----------
   quick_select_patterns = select.quick_select_patterns,
   hyperlink_rules = select.hyperlink_rules,
}
