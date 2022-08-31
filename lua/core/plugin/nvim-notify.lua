local M = {}

M.setup = function()
  local notify = require("notify")
  notify.setup({
    background_colour = "#000000",
  })
  vim.notify = notify
end

return M
