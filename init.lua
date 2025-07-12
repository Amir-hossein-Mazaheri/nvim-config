-- let require() find modules installed by LuaRocks
pcall(function() require("luarocks.loader") end)

vim.g.clipboard = {
  name = 'wl-clipboard-quiet',
  copy = {
    ['+'] = function(lines)
      local content = table.concat(lines, '\n')
      -- Redirect stderr to /dev/null to suppress proxychains logs
      local handle = io.popen('wl-copy 2>/dev/null', 'w')
      if handle then
        handle:write(content)
        handle:close()
      end
    end,
  },
  paste = {
    ['+'] = function()
      -- Redirect stderr to /dev/null to suppress proxychains logs
      local handle = io.popen('wl-paste --no-newline 2>/dev/null')
      if handle then
        local result = handle:read('*a')
        handle:close()
        return vim.split(result, '\n')
      end
      return {}
    end,
  },
}

require("holyamir")
