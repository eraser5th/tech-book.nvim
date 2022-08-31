local M = {}

M.setup = function()
  require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua" },
    automatic_installation = true,
  })

  require("mason-lspconfig").setup_handlers({
    function(server_name)
      local handlers = require("core.plugin.nvim-lspconfig.handlers")
      if handlers[server_name] then
        handlers[server_name]()
      else
        handlers.default(server_name)
      end
    end,
  })
end

return M
