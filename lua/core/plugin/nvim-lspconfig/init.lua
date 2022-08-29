local M = {}

M.setup = function()
  require("core.plugin.nvim-lspconfig.mason_setup").setup()
  require("core.plugin.nvim-lspconfig.mason_lspconfig_setup").setup()
end

return M
