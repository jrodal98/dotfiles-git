-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)


-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

-- smooth scroll
hooks.add("install_plugins", function(use)
   use {
       "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end
    }
 end)

-- all deletes and changes go to blackhole buffer except for custom mapped x
hooks.add("install_plugins", function(use)
   use {
       "svermeulen/vim-cutlass"
    }
 end)

hooks.add("install_plugins", function(use)
use {
  "blackCauldron7/surround.nvim",
  config = function()
    require"surround".setup {mappings_style = "sandwich"}
  end
}
end)

-- so the path of the config here basically is in the custom/plugin_confs/whichkey.lua

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)
   map("n", "*", "m`:keepjumps normal! *``<cr>") -- don't jump to next word when matching with *
   map("n", "<leader>sw", "*cgn", { noremap = false }) -- substitute word
   map("n", "<leader>sc", ":setlocal spell! spelllang=en_us<CR>") -- spellcheck
   -- next four map x to d. Used with cutlass
   map("n", "x", "d", { noremap = true })
   map("x", "x", "d", { noremap = true })
   map("n", "xx", "dd", { noremap = true })
   map("n", "X", "D", { noremap = true })
end)
