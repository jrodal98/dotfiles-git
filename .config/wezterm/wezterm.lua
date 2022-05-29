local wezterm = require "wezterm"
return {
   -- the default color scheme looks better tbh
   -- color_scheme = "tokyonight",
   window_background_opacity = 0.75,
   -- default bindings: https://wezfurlong.org/wezterm/config/default-keys.html
   keys = {
      { key = "+", mods = "SUPER|SHIFT", action = "IncreaseFontSize" },
      { key = "+", mods = "CTRL|SHIFT", action = "IncreaseFontSize" },
      {
         key = "e",
         mods = "CTRL|SHIFT",
         action = wezterm.action {
            QuickSelectArgs = {
               label = "open url",
               patterns = {
                  "https?://\\S+",
                  -- match diffs
                  "[dD]\\d+",
                  -- match tasks
                  "[tT]\\d+",
               },
               action = wezterm.action_callback(function(window, pane)
                  local url = window:get_selection_text_for_pane(pane)
                  wezterm.log_info("opening: " .. url)
                  wezterm.open_with(url)
               end),
            },
         },
      },
   },
   hide_tab_bar_if_only_one_tab = true,

   -- quick select mode (CTRL-SHIFT-SPACE)
   -- defaults include URLs, paths, ip addrs, etc
   quick_select_patterns = {
      -- match diffs
      "[dD]\\d+",
      -- match tasks
      "[tT]\\d+",
   },

   hyperlink_rules = {
      -- Linkify things that look like URLs
      -- This is actually the default if you don't specify any hyperlink_rules
      {
         regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
         format = "$0",
      },
      -- make diffs clickable
      {
         regex = "\\b[dD](\\d+)\\b",
         format = "https://internalfb.com/diff/$0",
      },
      -- make tasks clickable
      {
         regex = "\\b[tT](\\d+)\\b",
         format = "https://internalfb.com/tasks/?t=$1",
      },
   },
}
