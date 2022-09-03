local M = {}

M.setup = function()
  require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
      lua = {
        require("formatter.filetypes.lua").stylua,
      },
      javascript = {
        require("formatter.filetypes.javascript").eslint_d,
        require("formatter.filetypes.javascript").prettier,
      },
      typescript = {
        require("formatter.filetypes.typescript").eslint_d,
        require("formatter.filetypes.typescript").prettier,
      },
      javascriptreact = {
        require("formatter.filetypes.javascriptreact").eslint_d,
        require("formatter.filetypes.javascriptreact").prettier,
      },
      typescriptreact = {
        require("formatter.filetypes.typescriptreact").eslint_d,
        require("formatter.filetypes.typescriptreact").prettier,
      },
      ["*"] = {
        function()
          if vim.fn.has("macunix") == 1 then
            return { exe = "sed", args = { "-i", "''", "'s/[	 ]*$//'" } }
          else
            return require("formatter.filetypes.any").remove_trailing_whitespace()
          end
        end,
      },
    },
  })

  vim.api.nvim_create_augroup("FormatOnSave", {})
  vim.api.nvim_create_autocmd("BufWritePost", {
    command = "FormatWrite",
    pattern = "*",
    group = "FormatOnSave",
  })
end

return M
