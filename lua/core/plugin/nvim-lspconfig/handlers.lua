local handlers = {}

handlers.default = function(server_name)
  local capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )

  require("lspconfig")[server_name].setup({
    capabilities = capabilities,
  })
end

handlers.sumneko_lua = function()
  local luadev = require("lua-dev").setup({})
  require("lspconfig").sumneko_lua.setup(luadev)
end

return handlers
