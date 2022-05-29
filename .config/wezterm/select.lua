local select = {}

local url_regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b"
local ip_addr_regex = "\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b"
local diff_paste_task_regex = "\\b([dDpPtT]\\d+)\\b"

-- quick select mode (CTRL-SHIFT-SPACE)
select.quick_select_patterns = {
   -- match urls
   url_regex,
   -- match ip addresses
   ip_addr_regex,
   -- match diffs, pastes, and tasks
   diff_paste_task_regex,
}

select.hyperlink_rules = {
   -- Linkify things that look like URLs
   {
      regex = url_regex,
      format = "$0",
   },
   -- Linkify v4 ip addresses
   {
      regex = ip_addr_regex,
      format = "$0",
   },
   -- make diffs, pastes, and tasks clickable
   {
      regex = diff_paste_task_regex,
      format = "https://fburl.com/b/$1",
   },
}

-- used to transform quick select url patterns -> real urls
select.transform_url = function(selection)
   local diff_paste_task = string.match(selection, "[dDpPtT]%d+")
   if diff_paste_task then
      return "https://fburl.com/b/" .. diff_paste_task
   end

   return selection
end

return select
