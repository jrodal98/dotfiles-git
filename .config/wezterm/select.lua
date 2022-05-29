local select = {}

-- quick select mode (CTRL-SHIFT-SPACE)
-- defaults include URLs, paths, ip addrs, etc
select.quick_select_patterns = {
   -- match urls
   "https?://\\S+",
   -- match diffs
   "[dD]\\d+",
   -- match tasks
   "[tT]\\d+",
}

select.hyperlink_rules = {
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
