local M = {}

M.setup = function()
  local default_opts = require("lvim.lsp").get_common_opts()
  require("null-ls").setup(
    vim.tbl_deep_extend("force", default_opts, lvim.lsp.null_ls.setup)
  )
end

return M
