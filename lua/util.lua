local Table = require("module.Table")

local M = {}

M.set_keymaps = function(mode, keymaps)
  Table.forEach(keymaps, function(value, lhs)
    local rhs = value[1]
    local options = value[2]
    vim.keymap.set(mode, lhs, rhs, options)
  end)
end

M.if_expression = function(condition, then_value, else_value)
  if condition then
    return then_value
  else
    return else_value
  end
end

--- Returns true if the module is safe to require, false otherwise
--- @param module string
--- @return boolean
M.check_module_availability = function(module)
  local is_available, _ = pcall(require, module)
  return is_available
end

return M
