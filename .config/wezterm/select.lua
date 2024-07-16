local wezterm = require "wezterm"
local select = {}

local url_regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b"
local ip_addr_regex = "\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b"
local diff_paste_task_regex = "\\b([dDpPtT]\\d+)\\b"
-- match username/project paths, e.g. wbthomason/packer.nvim
local github_project_regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]]
local scvm_regex = "\\bscvm\\d+\\.\\d+\\.\\S*\\b"
local frecli_regex = "frecli cas download-action .*:145"
local buck_target_regex = "\\b([\\w]+//[\\w/]+:[\\w.-]+)\\b"
local windows_path_regex = "\\b([a-zA-Z]:\\\\[\\w .-]+(?:\\\\[\\w .-]+)*)\\b"

-- quick select mode (CTRL-SHIFT-SPACE)
select.quick_select_patterns = {
   -- match urls
   url_regex,
   -- match ip addresses
   ip_addr_regex,
   -- match diffs, pastes, and tasks
   diff_paste_task_regex,
   -- github_project_regex,
   -- match scvm hostnames
   scvm_regex,
   -- match buck2 frecli commands
   frecli_regex,
   buck_target_regex,
   windows_path_regex,
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
