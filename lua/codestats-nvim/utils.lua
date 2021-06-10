local vim = vim
local M = {}

-- Timezone related functions taken from http://lua-users.org/wiki/TimeZone

---Inserts str2 at the given position `pos` in str1
---@return string The updated string
local function insert(str1, str2, pos)
    return str1:sub(1,pos)..str2..str1:sub(pos+1)
end

---Returns the offset to UTC in seconds
local function get_timezone()
  local now = os.time()

  return os.difftime(now, os.time(os.date("!*t", now)))
end

---Returns the current unix timestamp in seconds
function M.unix_timestamp()
  return os.time(os.date("!*t"))
end

---Logs the given string to the error log of nvim
function M.log_error(str)
  vim.api.nvim_err_writeln(str)
end

---Return a timezone string in ISO 8601:2000 standard form (+hhmm or -hhmm)
--@return string The timezone offset
local function get_tzoffset()
  local timezone = get_timezone()
  local h, m = math.modf(timezone / 3600)

  return string.format("%+.4d", 100 * h + 60 * m)
end

---Returns the datetime string for CodeStats
---@return string The formatted string
function M.get_date_string()
  local curTime = os.time()
  local result = os.date('!%Y-%m-%dT%H:%M:%S', curTime) .. get_tzoffset()

  return insert(result, ":", #result - 2)
end

return M
