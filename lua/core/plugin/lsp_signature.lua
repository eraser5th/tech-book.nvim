local M = {}

M.setup = function()
  require("lsp_signature").setup({
    bind = true,
    handler_opts = {
      border = "rounded",
    },
  })
end

return M
