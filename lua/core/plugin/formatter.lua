local M = {}

M.setup = function()
  require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
      lua = {
        require("formatter.filetypes.lua").stylua,
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
