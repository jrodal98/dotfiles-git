local select = {}

local url_regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b"
local ip_addr_regex = "\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b"
local diff_regex = "\\b([dD]\\d+)\\b"

-- quick select mode (CTRL-SHIFT-SPACE)
select.quick_select_patterns = {
   -- match urls
   url_regex,
   -- match ip addresses
   ip_addr_regex,
   -- match diffs
   diff_regex,
   -- match tasks
   "\\b([tT]\\d+)\\b",
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
   -- make diffs clickable
   {
      regex = diff_regex,
      format = "https://internalfb.com/diff/$0",
   },
   -- make tasks clickable
   {
      regex = "\\b[tT](\\d+)\\b",
      format = "https://internalfb.com/tasks/?t=$1",
   },
}

-- used to transform quick select url patterns -> real urls
select.transform_url = function(selection)
   local diff = string.match(selection, "[dD]%d+")
   if diff then
      return "https://internalfb.com/diff/" .. diff
   end

   local task = string.match(selection, "[tT](%d+)")
   if task then
      return "https://internalfb.com/tasks/?t=" .. task
   end

   return selection
end

return select
