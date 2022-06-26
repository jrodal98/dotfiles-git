local wezterm = require "wezterm"
local select = require "select"
local actions = require "actions"

local META = "CTRL|SHIFT|ALT|SUPER"

local bindings = {}

-- default bindings: https://wezfurlong.org/wezterm/config/default-keys.html
bindings.keys = {
   { key = "+", mods = "SUPER|SHIFT", action = "IncreaseFontSize" },
   { key = "+", mods = "CTRL|SHIFT", action = "IncreaseFontSize" },
   {
      key = "e",
      mods = "CTRL|SHIFT",
      action = actions.open_url_action,
   },
   {
      key = "e",
      mods = META,
      action = actions.open_url_action,
   },
   {
      key = "Space",
      mods = META,
      action = "QuickSelect",
   },
   { key = "v", mods = META, action = actions.open_pane_in_vim },
   { key = "v", mods = "CTRL|SHIFT", action = actions.open_pane_in_vim },
}

bindings.key_tables = {
   copy_mode = {
      -- CUSTOM
      { key = "u", mods = "CTRL", action = wezterm.action { CopyMode = "PageUp" } },
      { key = "d", mods = "CTRL", action = wezterm.action { CopyMode = "PageDown" } },
      {
         key = "y",
         mods = "NONE",
         action = wezterm.action {
            Multiple = {
               wezterm.action { CopyTo = "ClipboardAndPrimarySelection" },
               wezterm.action { CopyMode = "Close" },
            },
         },
      },
      -- Enter search mode to edit the pattern.
      -- When the search pattern is an empty string the existing pattern is preserved
      { key = "/", mods = "NONE", action = wezterm.action { Search = { CaseInSensitiveString = "" } } },
      -- navigate any search mode results
      { key = "n", mods = "NONE", action = wezterm.action { CopyMode = "NextMatch" } },
      { key = "N", mods = "SHIFT", action = wezterm.action { CopyMode = "PriorMatch" } },
      { key = "p", mods = "CTRL", action = wezterm.action { CopyMode = "PriorMatch" } },
      { key = "n", mods = "CTRL", action = wezterm.action { CopyMode = "NextMatch" } },

      -- Cherry picked from defaults

      { key = "q", mods = "NONE", action = wezterm.action { CopyMode = "Close" } },
      { key = "Escape", mods = "NONE", action = wezterm.action { CopyMode = "Close" } },

      { key = "h", mods = "NONE", action = wezterm.action { CopyMode = "MoveLeft" } },
      { key = "j", mods = "NONE", action = wezterm.action { CopyMode = "MoveDown" } },
      { key = "k", mods = "NONE", action = wezterm.action { CopyMode = "MoveUp" } },
      { key = "l", mods = "NONE", action = wezterm.action { CopyMode = "MoveRight" } },

      { key = "LeftArrow", mods = "NONE", action = wezterm.action { CopyMode = "MoveLeft" } },
      { key = "DownArrow", mods = "NONE", action = wezterm.action { CopyMode = "MoveDown" } },
      { key = "UpArrow", mods = "NONE", action = wezterm.action { CopyMode = "MoveUp" } },
      { key = "RightArrow", mods = "NONE", action = wezterm.action { CopyMode = "MoveRight" } },

      { key = "RightArrow", mods = "ALT", action = wezterm.action { CopyMode = "MoveForwardWord" } },
      { key = "w", mods = "NONE", action = wezterm.action { CopyMode = "MoveForwardWord" } },

      { key = "LeftArrow", mods = "ALT", action = wezterm.action { CopyMode = "MoveBackwardWord" } },
      { key = "b", mods = "NONE", action = wezterm.action { CopyMode = "MoveBackwardWord" } },

      { key = "0", mods = "NONE", action = wezterm.action { CopyMode = "MoveToStartOfLine" } },
      { key = "$", mods = "NONE", action = wezterm.action { CopyMode = "MoveToEndOfLineContent" } },
      { key = "$", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToEndOfLineContent" } },

      { key = "^", mods = "NONE", action = wezterm.action { CopyMode = "MoveToStartOfLineContent" } },
      { key = "^", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToStartOfLineContent" } },

      { key = "v", mods = "NONE", action = wezterm.action { CopyMode = { SetSelectionMode = "Cell" } } },
      { key = "V", mods = "NONE", action = wezterm.action { CopyMode = { SetSelectionMode = "Line" } } },
      { key = "V", mods = "SHIFT", action = wezterm.action { CopyMode = { SetSelectionMode = "Line" } } },
      { key = "v", mods = "CTRL", action = wezterm.action { CopyMode = { SetSelectionMode = "Block" } } },

      { key = "G", mods = "NONE", action = wezterm.action { CopyMode = "MoveToScrollbackBottom" } },
      { key = "G", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToScrollbackBottom" } },
      { key = "g", mods = "NONE", action = wezterm.action { CopyMode = "MoveToScrollbackTop" } },

      { key = "H", mods = "NONE", action = wezterm.action { CopyMode = "MoveToViewportTop" } },
      { key = "H", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToViewportTop" } },
      { key = "M", mods = "NONE", action = wezterm.action { CopyMode = "MoveToViewportMiddle" } },
      { key = "M", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToViewportMiddle" } },
      { key = "L", mods = "NONE", action = wezterm.action { CopyMode = "MoveToViewportBottom" } },
      { key = "L", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToViewportBottom" } },

      { key = "o", mods = "NONE", action = wezterm.action { CopyMode = "MoveToSelectionOtherEnd" } },
      { key = "O", mods = "NONE", action = wezterm.action { CopyMode = "MoveToSelectionOtherEndHoriz" } },
      { key = "O", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToSelectionOtherEndHoriz" } },

      { key = "PageUp", mods = "NONE", action = wezterm.action { CopyMode = "PageUp" } },
      { key = "PageDown", mods = "NONE", action = wezterm.action { CopyMode = "PageDown" } },
   },
   search_mode = {
      { key = "Escape", mods = "NONE", action = wezterm.action { CopyMode = "Close" } },
      -- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
      -- to navigate search results without conflicting with typing into the search area.
      { key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
      { key = "r", mods = "CTRL", action = wezterm.action { CopyMode = "CycleMatchType" } },
      { key = "u", mods = "CTRL", action = wezterm.action { CopyMode = "ClearPattern" } },
   },
}

bindings.mouse = {
   --- Triple click on one character of the command output
   --  to select all of the output
   {
      event = { Down = { streak = 3, button = "Left" } },
      action = { SelectTextAtMouseCursor = "SemanticZone" },
      mods = "NONE",
   },
}

return bindings
