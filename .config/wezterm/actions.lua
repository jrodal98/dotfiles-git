local wezterm = require "wezterm"
local select = require "select"
local io = require "io"
local os = require "os"

local actions = {}

local nvim
if wezterm.hostname() == "jrodal-mbp" then
   nvim = "/usr/local/bin/nvim"
else
   nvim = "nvim"
end

actions.open_url_action = wezterm.action.QuickSelectArgs {
   label = "open url",
   patterns = select.quick_select_patterns,
   action = wezterm.action_callback(function(window, pane)
      local url = window:get_selection_text_for_pane(pane)
      wezterm.log_info("read url: " .. url)
      local transformed_url = select.transform_url(url)
      wezterm.log_info("opening: " .. transformed_url)
      wezterm.open_with(transformed_url)
   end),
}

-- https://wezfurlong.org/wezterm/config/lua/wezterm/on.html#custom-actions
actions.open_pane_in_vim = wezterm.action_callback(function(window, pane)
   -- Retrieve the current viewport's text.
   --
   -- Note: You could also pass an optional number of lines (eg: 2000) to
   -- retrieve that number of lines starting from the bottom of the viewport.
   local viewport_text = pane:get_lines_as_text(100000)

   -- Create a temporary file to pass to vim
   local name = os.tmpname()
   local f = io.open(name, "w+")
   f:write(viewport_text)
   f:flush()
   f:close()

   -- Open a new window running vim and tell it to open the file
   window:perform_action(
      wezterm.action.SpawnCommandInNewWindow {
         args = { nvim, name },
      },
      pane
   )

   -- Wait "enough" time for vim to read the file before we remove it.
   -- The window creation and process spawn are asynchronous wrt. running
   -- this script and are not awaitable, so we just pick a number.
   --
   -- Note: We don't strictly need to remove this file, but it is nice
   -- to avoid cluttering up the temporary directory.
   wezterm.sleep_ms(1000)
   os.remove(name)
end)

return actions
