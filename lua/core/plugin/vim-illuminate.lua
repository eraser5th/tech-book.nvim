local M = {}

M.setup = function ()
  vim.g.Illuminate_delay = 400
  vim.g.Illuminate_highlightUnderCursor = 1
  vim.g.Illuminate_ftblacklist = { NvimTree_1 }
end

return M
