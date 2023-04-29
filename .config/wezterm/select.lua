local wezterm = require "wezterm"
local select = {}

local url_regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b"
local ip_addr_regex = "\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b"
local diff_paste_task_regex = "\\b([dDpPtT]\\d+)\\b"
local github_project_regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]]

-- quick select mode (CTRL-SHIFT-SPACE)
select.quick_select_patterns = {
   -- match urls
   url_regex,
   -- match ip addresses
   ip_addr_regex,
   -- match diffs, pastes, and tasks
   diff_paste_task_regex,
   -- match username/project paths, e.g. wbthomason/packer.nvim
   github_project_regex,
}

select.hyperlink_rules = wezterm.default_hyperlink_rules()

table.insert(select.hyperlink_rules, {
   regex = diff_paste_task_regex,
   format = "https://fburl.com/b/$1",
})

table.insert(select.hyperlink_rules, {
   regex = github_project_regex,
   format = "https://www.github.com/$1/$3",
})

return select
